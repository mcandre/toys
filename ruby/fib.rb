#!/usr/bin/env ruby

require 'contracts'
include Contracts

module Fib
    Contract Num => Num
    def self.fib(n)
        if n < 2
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

    # # recursion overhead is slow

    # Contract Num => Num
    # def fib(n)
    #     if n < 2
    #         n
    #     else
    #         fib(n - 1) + fib(n - 2)
    #     end
    # end
end

def main
    print 'N = '

    n = gets.chomp.to_i

    puts 'Running'

    # startt = time

    x = Fib.fib(n)

    # endt = time

    puts "Fib #{n} = #{x}"

    # puts "Time: #{endt - startt} sec"
end

main if $PROGRAM_NAME == __FILE__
