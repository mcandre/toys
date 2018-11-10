#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2008 Andrew Pennebaker

require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'contracts'
include Contracts

Contract nil => Num
def get_counter
    f = open('http://feeds.spreadfirefox.com/downloads/firefox.xml')
    data = f.read
    f.close

    h = Hpricot(data)
    counter = (h / 'rss' / 'channel' / 'item' / 'description').inner_html

    counter.to_i
rescue
    0
end

def main
    puts get_counter
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue RuntimeError => e
        puts e
    rescue Interrupt
        nil
    end
end
