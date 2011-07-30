#!/usr/bin/env python

import time

if __name__=="__main__":
	def fib(n):
		if n<2:
			return n
		else:
			a, b=0, 1

			m=n-1

			i=0
			while i<m:
				a, b=b, a+b
				i+=1

			return b

	# recursion overhead is slow
	#
	#def fib(n):
	#	if n==0:
	#		return 0
	#	elif n==1:
	#		return 1
	#	else:
	#		return fib(n-1)+fib(n-2)

	N=int(raw_input("N = "))

	print "Running"

	startt=time.time()

	x=fib(N)

	endt=time.time()

	print "Fib %d = %d" % (N, x)

	print "Time = %d sec" % (endt-startt)