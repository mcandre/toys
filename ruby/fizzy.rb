#!/usr/bin/env ruby

require "rubygems"
require "parallel"
require "contracts"
include Contracts

Contract Num => String
def fizz(n)
  x, y = n % 3, n % 5

  if [x, y] == [0, 0]
    "FizzBuzz"
  elsif x == 0
    "Fizz"
  elsif y == 0
    "Buzz"
  else
    n.to_s
  end
end

def main
  Parallel.map(1.upto(100)) { |i| fizz(i) }.each { |s| puts s }
end

main if __FILE__ == $0
