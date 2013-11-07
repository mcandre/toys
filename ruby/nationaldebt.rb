#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2008 Andrew Pennebaker

require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'contracts'
include Contracts

Contract nil => String
def get_debt
  f = open 'http://www.brillig.com/debt_clock/'
  data = f.read
  f.close

  h = Hpricot(data)

  (h / 'body' / 'blockquote' / 'center' / 'p' / 'table' / 'tr' / 'td' / 'img').first[:alt].split(' ').join('')
end

def main
  puts get_debt
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Timeout::Error
    puts 'Could not connect.'
  rescue Interrupt
    nil
  end
end
