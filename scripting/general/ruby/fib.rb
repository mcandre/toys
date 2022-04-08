#!/usr/bin/env ruby

module Fib
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
end

def main
    print 'N = '

    n = gets.chomp.to_i

    puts 'Running'

    x = Fib.fib(n)

    puts "Fib #{n} = #{x}"
end

main if $PROGRAM_NAME == __FILE__
