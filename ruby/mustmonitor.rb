#!/usr/bin/env ruby

# Andrew Pennebaker
# Copyright 2009 YelloSoft

require 'open-uri'
require 'contracts'
include Contracts

Contract nil => Bool
def must_blocking_or_offline?
    f = open 'http://icanhazip.com/'
    data = f.read
    f.close

    octets = data.split('.')

    fail unless octets.length == 4
rescue
    true
else
    false
end

def main
    if must_blocking_or_offline?
        puts '-OFFLINE'
    else
        puts '+ONLINE'
    end
end

main if $PROGRAM_NAME == __FILE__
