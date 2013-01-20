#!/usr/bin/env ruby

def fizz(n)
	if n % 15 == 0
		return "FizzBuzz"
	elsif n % 3 == 0
		return "Fizz"
	elsif n % 5 == 0
		return "Buzz"
	else
		return n.to_s
	end
end

def main
	1.upto(100) { |i| puts fizz(i) }
end

main if __FILE__ == $0