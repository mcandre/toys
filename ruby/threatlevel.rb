#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2008 Andrew Pennebaker

require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'contracts'
include Contracts

Contract nil => String
def get_level
  f = open('http://www.dhs.gov/dhspublic/getAdvisoryCondition')
  data = f.read
  f.close

  h = Hpricot(data)
  h.search('threat_advisory').first[:condition]
end

def main
  puts get_level
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Timeout::Error
    puts 'Could not connect'
  rescue Interrupt
    nil
  end
end
