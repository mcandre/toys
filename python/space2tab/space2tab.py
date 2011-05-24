#!/usr/bin/env python

"""Convert spaces to tabs."""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="12 Nov 2005 - 12 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.4"

import re
import sys
from getopt import getopt

firstSpaces=re.compile(r"(\s+)\S")

def getSpaceLength(lines):
	"""Uses number of spaces in first line with leading spaces as tab length.
Defaults to tab = 2 spaces."""

	length=2

	for line in lines:
		m=firstSpaces.match(line)

		try:
			length=len(m.group(1))
			break
		except Exception, e:
			pass

	return length

def replaceSpaces(lines, length):
	mark=" "*length
	newcode=[]
	for line in lines:
		newcode.append(re.sub(mark, "\t", line))

	return newcode

def space2tab(input, output, length=None):
	f=open(input, "r")
	text=f.readlines()
	f.close()

	if length==None:
		length=getSpaceLength(text)
	text=replaceSpaces(text, length)

	f=open(output, "w")
	f.write("".join(text))
	f.close()

def usage():
	print "Usage: %s [options] <inputfile> <outputfile>" % (sys.argv[0])
	print "\n-t|--tablength <specified length>"
	print "-h|--help (usage)"

	sys.exit()

def main():
	inputfile=None
	outputfile=None
	tablength=None

	systemArgs=sys.argv[1:] # ignore program name
	optlist=[]
	args=[]

	try:
		optlist, args=getopt(systemArgs, "t:h", ["tablength=", "help"])
	except Exception, e:
		usage()

	if len(args)<2:
		usage()

	inputfile=args[0]
	outputfile=args[1]

	for option, value in optlist:
		if option=="-h" or option=="--help":
			usage()

		elif option=="-t" or option=="--tablength":
			try:
				tablength=int(value)
				if tablength<1:
					raise Exception
			except Exception, e:
				raise "Tablength is at least 1"

	space2tab(inputfile, outputfile, tablength)

if __name__=="__main__":
	main()