#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# fetch <command>

parser = 'http://fetch.yellosoft.us/?fetch='

command = ARGV.join '+'

system "open #{parser}#{command}"
