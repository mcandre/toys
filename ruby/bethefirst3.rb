#!/usr/bin/env ruby

require "open-uri"
require "time"
require "pp"

def main
	puts "Awaiting release."

	while true
		t=Time.now

		puts "Checking mozilla.com #{t.hour}:#{t.min}:#{t.sec}"

		data=""

		begin
			f=open("http://www.mozilla.com/")
			data=f.read
			f.close
		rescue Timeout::Error=>e
			puts "Could not connect. Timed out."
		# Connection error
		rescue SocketError=>e
			puts "Could not connect. Check network connections."
		# HTTP specific error
		rescue OpenURI::HTTPError=>e
			if e.to_s.include?("503")
				puts "Website unavailable. Possible update in progress."
			else
				puts e
			end
		# Timeout
		rescue Errno::ETIMEDOUT=>e
			puts "Timeout. Possible update in progress."
		# Timeout
		rescue Errno::ECONNRESET=>e
			puts "Timeout. Possible update in progress."
		# Got a web page
		else
			pp data

			data.downcase!

			using_proxy=true
			if data.include?("firefox") and data.include?("<a href=\"https://addons.mozilla.org/\">")
				using_proxy=false
			end

			new_firefox_release=false
			if (not data.include?("<html><body><b>Http/1.1 Service Unavailable</b></body> </html>")) and (not data.include?("2.0.0.14"))
				new_firefox_release=true
			end

			if using_proxy
				puts "Error: Behind a proxy."
			elsif new_firefox_release
				puts "Firefox 3 released!"

# Roommate annoyed by so many false updates.
#				puts "Sounding alert."
#				system("open favthings.mp3")

				puts "Opening announcement page."

				system("open http://www.mozilla.com/")

				break
			# Not released yet; wait 1 second and reload
			else
				sleep 1
			end
		end
	end
end

if __FILE__==$0
	begin
		main
	rescue Interrupt=>e
		nil
	end
end