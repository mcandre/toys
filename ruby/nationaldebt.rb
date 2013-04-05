#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2008 Andrew Pennebaker

require "open-uri"
require "rubygems"
require "hpricot"

def get_debt
  f = open "http://www.brillig.com/debt_clock/"
  data = f.read
  f.close

  h = Hpricot(data)

  return (h/"body"/"blockquote"/"center"/"p"/"table"/"tr"/"td"/"img").first[:alt].split(" ").join("")
end

def main
  puts get_debt
end

if __FILE__ == $0
  begin
    main
  rescue Timeout::Error=>e
    puts "Could not connect."
  rescue Interrupt => e
    nil
  end
end
