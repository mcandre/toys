#!/usr/bin/env python

"""Splits and joins files. Helpful when media can't fit a file.
Be prepared for a lot of output files!"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="6 Jan 3006 - 12 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.3"
__URL__="http://snippets.dzone.com/posts/show/3541"

import sys, os
from getopt import getopt

SPLIT_MODE="SPLIT"
JOIN_MODE="JOIN"

def splitFile(name, length, number):
	if length==None:
		infile=open(name, "rb")
		size=0
		while infile.read(1)!="":
			size+=1

		infile.close()

		maxlength=size/number
		if number*maxlength<size:
			maxlength+=1

	else:
		if length<1:
			raise Exception

	infile=None
	try:
		infile=open(name, "rb")
	except Exception, e:
		raise e

	i=0
	j=0
	c=infile.read(1)
	while c!="":
		outfile=None
		try:
			outfile=open("%s.%d" % (name, j), "wb")
		except Exception, e:
			raise e

		while i<length and c!="":
			outfile.write(c)
			c=infile.read(1)
			i+=1

		outfile.close()
		i=0
		j+=1

	infile.close()

def joinFiles(filenames):
	if len(filenames)<1:
		raise Exception

	filenames.sort() # ...0 must be first

	origFilename=filenames[0][0:-2] # take ".0" off the first file name
	origFile=None

	try:
		origFile=open(origFilename, "wb")
	except Exception, e:
		raise e

	c="&" # dummy

	for filename in filenames:
		smallFile=None
		try:
			smallFile=open(filename, "rb")
		except Exception, e:
			raise e

		c=smallFile.read(1)
		while c!="":
			origFile.write(c)
			c=smallFile.read(1)

		smallFile.close()

	origFile.close()

def usage():
	print "Usage: %s [options] [files]" % (sys.argv[0])
	print "\n--split <file1 file 2 file 3...>"
	print "--join <dir1 dir2 dir3 ...>"
	print "--maxlength <bytes>"
	print "--maxfiles <number>"
	print "--help (usage)"

	sys.exit()

def main():
	global SPLIT_MODE
	global JOIN_MODE

	mode=SPLIT_MODE
	filenames=[]
	maxlength=1024
	maxfiles=None

	systemArgs=sys.argv[1:] # ignore program name

	optlist=[]
	args=[]

	try:
		optlist, args=getopt(systemArgs, "", ["split", "join", "maxlength=", "maxfiles=", "help"])
	except Exception, e:
		usage()

	if len(optlist)<1 or len(args)<1:
		usage()

	for option, value in optlist:
		if option=="--help":
			usage()

		elif option=="--split":
			mode=SPLIT_MODE
		elif option=="--join":
			mode=JOIN_MODE
		elif option=="--maxlength":
			try:
				maxlength=int(value)
				if maxlength<1:
					raise Exception
				maxfiles=None
			except Exception, e:
				raise "Length must be at least one"
		elif option=="--maxfiles":
			try:
				maxfiles=int(value)
				if maxfiles<1:
					raise Exception
				maxlength=None
			except Exception, e:
				raise "Number must be at least one"

	filenames=args

	if mode==SPLIT_MODE:
		for filename in filenames:
			try:
				splitFile(filename, maxlength, maxfiles)
			except Exception, e:
				raise e

	elif mode==JOIN_MODE:
		for directory in filenames:
			files=["%s%s%s" % (directory, os.sep, file) for file in os.listdir(directory)]

			try:
				joinFiles(files)
			except Exception, e:
				raise e

if __name__=="__main__":
	main()
