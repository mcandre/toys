#!/usr/bin/env ruby

def flip(sequence, howmany)
	return sequence[0, howmany].reverse()+sequence[howmany, sequence.length-howmany]
end

def disordered?(sequence)
	1.upto(sequence.length-1) { |i|
		return true if sequence[i-1] > sequence[i]
	}

	return false
end

def gen_numbers
	input=(1..9).to_a
	numbers=[]
	0.upto(input.length-1) { |i|
		numbers << input.delete_at(rand(input.length))
	}

	return numbers
end

def main
	input=(1..9).to_a
	numbers=[]

	if ARGV.length==0
		numbers=gen_numbers
	else
		ARGV.each { |arg|
			numbers.push(arg.to_i)
		}
	end

	count=0
	while disordered?(numbers)
		print "#{numbers.join(" ")}\nHow many to flip? "
		howmany=gets()
		howmany=howmany.to_i
		numbers=flip(numbers, howmany)
		count+=1
	end

	puts "Done! That took you #{count} steps."

if __FILE__==$0
	begin
		main
	rescue Interrupt => e
		nil
	end
end