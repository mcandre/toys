#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# fetch <command>

parser = 'https://duckduckgo.com/?q='

command = ARGV.join '+'

system "open #{parser}#{command}"
