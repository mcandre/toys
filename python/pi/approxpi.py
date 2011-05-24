#!/usr/bin/env python

"""Uses
            . b
4 lim      |    1/(x^2+1) dx
  b -> oo .   0

to approximate Pi"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="17 Jan 2006 - 12 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.1"

import math, sys

def approxpi(b=1000L):
	return 2L*math.atan(b)

def usage():
	print "Usage: %s <large number>" % (sys.argv[0])

	sys.exit()

def main():
	systemArgs=sys.argv[1:] # ignore program name

	n=1000L

	try:
		n=long(sys.argv[1])
		if b<0:
			raise Exception
	except Exception, e:
		usage()

	print approxpi(n)

if __name__=="__main__":
	main()
