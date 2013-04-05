module Speakable
  def speak
    puts "Yo!"
  end
end

class Student
  include Speakable

  attr_accessor :name, :gender, :age

  def initialize(name, gender, age)
    @name = name
    @gender = gender
    @age = age
  end

  def speak
    puts "Yo, my name is #{@name}!"
  end

  def to_s
    return "#{@name} #{@gender} #{@age}"
  end
end

class Senior < Student
  attr_accessor :credits_left

  def initialize(name, gender, age, credits_left)
    super(name, gender, age)
    @credits_left = credits_left
  end

  def to_s
    return super + " Credits left: #{@credits_left}"
  end
end

s1 = Student.new("Bob", :m, 14)

puts s1

s2 = Senior.new("Betty", :f, 18, 6)

puts s2

puts s1.name

puts s2.credits_left

s1.name = "Roberto"

puts s1.name

s1.speak

s2.speak
