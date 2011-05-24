#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="7 Dec 2006 - 12 Jun 2007"
__copyright__="Copyright 2006 Andrew Pennebaker"

import time

START=0
AUX=1
END=2

def hanoi(n, start, aux, end):
	if n==1:
		return (start, end)

	return (
		hanoi(n-1, start, aux, end)+
		(start, aux)+
		hanoi(n-1, aux, end, start)
	)

def main():
	n=input("N = ")

	print "Running"

	startt=time.time()

	steps=hanoi(n, START, AUX, END)

	endt=time.time()

	print "Time = %d sec" % (endt-startt)

	#print "Steps = %s" % str(steps)

if __name__=="__main__":
	try:
		main()
	except KeyboardInterrupt, e:
		pass