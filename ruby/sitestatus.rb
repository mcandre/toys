#!/usr/bin/env ruby

require 'open-uri'
require 'contracts'
include Contracts

Contract String => String
def site_status(domain)
  data = nil

  begin
    data = open("http://www.iwebtool.com/tool/tools/server_status/server_status.php?domain=#{domain}").read
  rescue
    return 'unknown'
  end

  if data['The website is accessible!']
    'up'
  else
    'down'
  end
end

def main
  ARGV.each { |arg| puts "#{arg}: #{site_status(arg)}" }
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Interrupt
    nil
  end
end
