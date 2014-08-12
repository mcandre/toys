#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# yn <command>

def main
  parser = 'http://yubnub.org/parser/parse?command='

  command = ARGV.join '+'

  system "open #{parser}#{command}"
end

main if $PROGRAM_NAME == __FILE__
