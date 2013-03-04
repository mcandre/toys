#!/usr/bin/env ruby

require "contracts"
include Contracts

Contract Num => Num
def fib(n)
  if n<2
    n
  else
    a, b = 0, 1

    m = n - 1

    i = 0
    while i < m
       a, b = b, a + b
       i += 1
    end

    b
  end
end

# recursion overhead is slow
#
#def fib(n)
#  if n < 2
#     n
#  else
#     fib(n - 1) + fib(n - 2)
#  end
#end

print "N = "

n = gets.chomp.to_i

puts "Running"

#startt = time

x = fib(n)

#endt = time

puts "Fib #{n} = #{x}"

#puts "Time: #{endt - startt} sec"
