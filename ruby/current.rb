#!/usr/bin/env ruby

def main
  puts File.dirname($PROGRAM_NAME)
end

main if $PROGRAM_NAME == __FILE__
