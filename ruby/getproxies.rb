#!/usr/bin/env ruby

require 'open-uri'
require 'contracts'
include Contracts

Contract nil => ArrayOf[String]
def get_proxies
  url = 'http://www.steganos.com/?area=updateproxylist'

  proxies = []

  open(url) do |f|
    f.each_line do |line|
      proxies << line
    end
  end

  proxies
rescue
  raise "Unable to access #{url}"
end

def main
  proxies = get_proxies
  puts proxies
rescue
  puts 'Could not connect to Steganos'
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Interrupt
    nil
  end
end
