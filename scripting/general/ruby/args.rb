#!/usr/bin/env ruby

def main
    ARGV.each do |arg|
        puts "#{arg}"
    end
end

main if $PROGRAM_NAME == __FILE__
