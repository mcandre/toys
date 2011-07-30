#!/usr/bin/env python

"""Uses

  oo
  --
6  >  (-1)^n / (n^2)
  --
  n=1

with remainder < 1 / (n+1)^2

to approximate Pi"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="9 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.0.1" # not currently working

import math

from decimal import *

import sys

from getopt import getopt

def approxpi(n=1000, precision=1000):
	getcontext().prec=precision

	s=Decimal(0)
	x=1
	while x<=n:
		s+=((-1)**x)/Decimal(x*x)
		x+=1

	pi=abs(12*s).sqrt()

	remainder=(12/Decimal((n+1)**2)).sqrt()

	return (pi, remainder)

def usage():
	print "Usage: %s [options]" % (sys.argv[0])
	print "\n--n large number n"
	print "--precision digits"
	print "--help (usage)"

	sys.exit()

def main():
	systemArgs=sys.argv[1:] # ignore program name

	n=1000
	p=1000

	optlist=[]

	try:
		optlist, args=getopt(systemArgs, None, ["n=", "precision=", "help"])
	except Exception:
		usage()

	for option, value in optlist:
		if option=="--help":
			usage()

		elif option=="--n":
			try:
				n=int(value)
				if n<1:
					raise Exception
			except Exception:
				raise Exception("N must be at least 1")
		elif option=="--precision":
			try:
				p=int(value)
				if p<1:
					raise Exception
			except Exception:
				raise Exception("Precision must be at least 1")

	result=approxpi(n, p)

	print "Pi:\n%s\n" % (result[0])
	print "Remainder:\n%s" % (result[1])

if __name__=="__main__":
	main()
