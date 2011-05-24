#!/usr/bin/env python

import sys
from getopt import getopt

def t(t, mult, div):
	m=2
	d=3
	pow=t
	sum=t

	while pow > 0:

		pow = (pow*mult/div)*m/d

		m+=2
		d+=2
		sum+=pow

	return sum

def usage():
	print "Usage: %s [--n n] [--precision precision] [--help]" % (sys.argv[0])

	sys.exit()

def main():
	systemArgs=sys.argv[1:] # ignore program name

	po=1L
	n=90000L # n=4000

	optlist=[]
	args=[]

	try:
		optlist, args=getopt(systemArgs, None, ["n=", "precision=", "help"])
	except Exception, e:
		usage()

	for option, value in optlist:
		if option=="--help":
			usage()

		elif option=="--n":
			try:
				n=long(value)
				if n<5:
					raise Exception
			except Exception, e:
				raise "N is at least 1"
		elif option=="--precision":
			try:
				po=long(value)
				if po<1:
					raise Exception
			except Exception, e:
				raise "Precision is at least 1"

	for i in range(0, n-5):
		po *= 10

	pi = t(280000*po, 2, 100) + t(30336*po, 144, 100000)

	print pi

if __name__=="__main__":
	main()