#!/usr/bin/env ruby

require 'open-uri'

def main
  data = ''

  while data == ''
    begin
      data = open('http://www.google.com/').read
    rescue
      nil
    end
  end

  system 'say You are now online.'
end

main if $PROGRAM_NAME == __FILE__
