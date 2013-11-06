#!/usr/bin/env ruby

require "open-uri"
require "contracts"
include Contracts

Contract nil => ArrayOf[String]
def get_proxies
  url = "http://www.steganos.com/?area=updateproxylist"

  proxies = []

  begin
    open(url) { |f|
      f.each_line { |line|
        proxies << line
      }
    }
  rescue
    raise "Unable to access #{url}"
  end

  proxies
end

def main
  begin
    proxies = get_proxies
    puts proxies
  rescue
    puts "Could not connect to Steganos"
  end
end

if __FILE__ == $0
  begin
    main
  rescue Interrupt => e
    nil
  end
end
