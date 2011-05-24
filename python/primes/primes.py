#!/usr/bin/env python

"""Lists all primes"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="26 Nov 2005 - 12 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.2"

from makerange import makerange

import sys
from getopt import getopt

from factor import getAllFactors

def usage():
	print "Usage: %s <number/range> [--help]"

	sys.exit()

def main():
	low=1L
	high=1L

	systemArgs=sys.argv[1:] # ignore program name
	optlist=[]
	args=[]

	if len(args)<1:
		usage()

	try:
		optlist, args=getopt(systemArgs, None, ["help"])
	except Exception, e:
		usage()

	for option, value in optlist:
		if option=="--help":
			usage()

	numbers=makerange(args[0], 1, 10**25)

	print "Factoring"

	for n in numbers:
		print " ".join(getAllFactors(n))

if __name__=="__main__":
	main()