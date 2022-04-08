#!/usr/bin/env ruby

require 'rubygems'
require 'parallel'

#
# FizzBuzz
#
class Fixnum
    def fizz
        x, y = self % 3, self % 5

        if [x, y] == [0, 0]
            'FizzBuzz'
        elsif x == 0
            'Fizz'
        elsif y == 0
            'Buzz'
        else
            to_s
        end
    end
end

def main
    Parallel.map(1.upto(100)) { |i| i.fizz }.each { |s| puts s }
end

main if $PROGRAM_NAME == __FILE__
