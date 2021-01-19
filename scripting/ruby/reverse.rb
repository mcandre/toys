#!/usr/bin/env ruby

require 'contracts'
include Contracts

Contract ArrayOf[Num] => ArrayOf[Num]
def self.flip(sequence, howmany)
    sequence[0, howmany].reverse + sequence[howmany, sequence.length - howmany]
end

Contract ArrayOf[Num] => Bool
def self.disordered?(sequence)
    (1 .. sequence.length - 1).each do |i|
        return true if sequence[i - 1] > sequence[i]
    end

    false
end

Contract ArrayOf[Num] => ArrayOf[Num]
def gen_numbers(input)
    len = input.length

    input = (1 .. 9).to_a
    numbers = []

    (0 .. len - 1).each do |i|
        numbers << input.delete_at(rand(len))
    end

    numbers
end

def main
    input = (1 .. 9).to_a
    numbers = []

    if ARGV.length == 0
        numbers = gen_numbers(input)
    else
        ARGV.each do |arg|
            numbers.push(arg.to_i)
        end
    end

    count = 0
    while disordered?(numbers)
        print "#{numbers.join(" ")}\nHow many to flip? "
        howmany = gets
        howmany = howmany.to_i
        numbers = flip(numbers, howmany)
        count += 1
    end

    puts "Done! That took you #{count} steps."
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue Interrupt
        nil
    end
end
