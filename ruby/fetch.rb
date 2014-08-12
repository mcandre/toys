#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# fetch <command>

def main
  parser = 'http://fetch.yellosoft.us/?fetch='

  command = ARGV.join '+'

  system "open #{parser}#{command}"
end

main if $PROGRAM_NAME == __FILE__
