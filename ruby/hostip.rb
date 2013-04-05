#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# hostip [OPTIONS] [<ip1> <ip2> <ip3> ...]
#
# --help, -h:
#    help with usage
#
# --address, -a <IP>:
#    show information for specific IP address
#
# --position, -p:
#    show latitude and longitude

require "getoptlong"
require "rdoc/usage"
require "open-uri"

def prepare_api(settings)
  url = "http://#{settings[:domain]}#{settings[:api]}"
  url += "&ip=#{settings[:ip]}" if settings[:ip].length > 0
  url += "&position=true" if settings[:position]

  url
end

def geoip(settings)
  url = prepare_api(settings)

  begin
    open(url) { |f| f.readlines }
  rescue
    raise "Unable to access #{url}"
  end
end

def main
  settings = {
    :domain => "api.hostip.info",
    :api => "/get_html.php?",
    :ip => "",
    :position => false
  }

  begin
    opts=GetoptLong.new(
      ["--help", "-h", GetoptLong::NO_ARGUMENT],
      ["--address", "-a", GetoptLong::REQUIRED_ARGUMENT],
      ["--position", "-p", GetoptLong::NO_ARGUMENT]
    )

    opts.each { |option, value|
      case option
      when "--help"
        raise
      when "--address"
        settings[:ip] = value
      when "--position"
        settings[:position] = true
      end
    }
  rescue
    RDoc::usage("Usage")
  end

  args = [] + ARGV
  args << "" if args.length == 0

  args.each { |ip|
    settings[:ip] = ip
    begin
      puts geoip(settings)
    rescue SocketError => e
      puts "Could not connect to #{settings[:domain]}"
    end
  }
end

if __FILE__ == $0
  begin
    main
  rescue Interrupt => e
    nil
  end
end
