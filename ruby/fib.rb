#!/usr/bin/env ruby

def fib(n)
	if n<2
		return n
	else
		a, b=0, 1

		m=n-1

		i=0
		while i<m
			a, b=b, a+b
			i+=1
		end

		return b
	end
end

# recursion overhead is slow
#
#def fib(n)
#	if n==0
#		return 0
#	elsif n==1
#		return 1
#	else
#		return fib(n-1)+fib(n-2)
#	end
#end

print "N = "

n=gets.chomp.to_i

puts "Running"

#startt=time

x=fib(n)

#endt=time

puts "Fib  #{n} = #{x}"

#puts "Time: #{endt-startt} sec"