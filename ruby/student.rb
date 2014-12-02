#!/usr/bin/env ruby

require 'contracts'
include Contracts

#
# Speakable
#
module Speakable
  Contract nil => String
  def speak
    puts 'Yo!'
  end
end

#
# Student
#
class Student
  include Speakable

  attr_accessor :name, :gender, :age

  Contract String, Symbol, Num => Num
  def initialize(name, gender, age)
    @name = name
    @gender = gender
    @age = age
  end

  Contract nil => Or[String, nil]
  def speak
    puts "Yo, my name is #{@name}!"
  end

  Contract nil => String
  def to_s
    "#{@name} #{@gender} #{@age}"
  end
end

#
# Senior Student
#
class Senior < Student
  attr_accessor :credits_left

  Contract String, Symbol, Num, Num => Num
  def initialize(name, gender, age, credits_left)
    super(name, gender, age)
    @credits_left = credits_left
  end

  Contract nil => String
  def to_s
    super + " Credits left: #{@credits_left}"
  end
end

def main
  s1 = Student.new('Bob', :m, 14)

  puts s1

  s2 = Senior.new('Betty', :f, 18, 6)

  puts s2

  puts s1.name

  puts s2.credits_left

  s1.name = 'Roberto'

  puts s1.name

  s1.speak

  s2.speak
end

main if $PROGRAM_NAME == __FILE__
