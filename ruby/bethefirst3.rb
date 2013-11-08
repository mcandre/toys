#!/usr/bin/env ruby

require 'open-uri'
require 'time'
require 'pp'

def main
  puts 'Awaiting release.'

  new_firefox_release = false

  until new_firefox_release
    t = Time.now

    puts "Checking mozilla.com #{t.hour}:#{t.min}:#{t.sec}"

    data = ''

    begin
      f = open('http://www.mozilla.com/')
      data = f.read
      f.close
    rescue SocketError => e
      puts 'Could not connect. Check network connections.'
    rescue OpenURI::HTTPError => e
      if e.to_s.include?('503')
        puts 'Website unavailable. Possible update in progress.'
      else
        puts e
      end
    rescue Timeout::Error, Errno::ETIMEDOUT, Errno::ECONNRESET => e
      puts 'Timeout. Possible update in progress.'
    else
      pp data

      data.downcase!

      using_proxy = !(data.include?('firefox') && data.include?('<a href=\"https://addons.mozilla.org/\">'))

      new_firefox_release = !data.include?(
        '<html><body><b>Http/1.1 Service Unavailable</b></body> </html>'
        ) &&
          !data.include?('2.0.0.14')

      if using_proxy
        puts 'Error: Behind a proxy.'
      elsif new_firefox_release
        puts 'Firefox 3 released!'

        # Roommate annoyed by so many false updates.
        # puts 'Sounding alert.'
        # system('open favthings.mp3')

        puts 'Opening announcement page.'

        system('open http://www.mozilla.com/')

        # Not released yet; wait 1 second and reload
      else
        sleep 1
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Interrupt
    nil
  end
end
