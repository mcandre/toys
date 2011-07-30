#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="6 May 2006 - 8 Aug 2007"
__copyright__="Copyright 2006 2007 Andrew Pennebaker"
__version__="0.1"

import logging
import random
import sys
from getopt import getopt

logger=logging.getLogger("File")
fileHandler=logging.FileHandler("KenanKelQuote.log")
formatter=logging.Formatter("%(asctime)s %(levelname)s %(message)r")
fileHandler.setFormatter(formatter)
logger.addHandler(fileHandler)
logger.setLevel(logging.INFO)

objects=[]
places=[]

def setLogLevel(level):
	global logger

	logger.setLevel(level)

def loadLines(filename):
	global logger

	logger.debug("Opening %s" % (filename))

	f=open(filename, "r")

	logger.debug("Opened %s in read text mode" % (filename))
	logger.debug("Reading lines")

	lines=("".join(f.readlines())).split("\n")

	logger.debug("Read lines")
	logger.debug("Closing %s" % (filename))

	f.close()

	logger.debug("Closed %s" % (filename))

	return lines

def loadQuotes(objectfile="objects.txt", placefile="places.txt"):
	global objects
	global places
	global logger

	try:
		logger.debug("Loading object lines")

		objects=loadLines(objectfile)

		logger.debug("Loaded object lines %s" % (objects))
		logger.debug("Loading place lines")

		places=loadLines(placefile)

		logger.debug("Loaded place lines %s" % (places))
	except:
		logger.error("Error loading files")

		raise Exception("Error loading files")

	if len(objects)<1 or len(places)<1:
		logger.warn("Objects or places empty: %s %s" % (objects, places))

def getQuote():
	global objects
	global places
	global logger

	logger.debug("Getting random objects")

	o=[random.choice(objects) for i in range(3)]

	logger.debug("Got random objects: %s" % (o))
	logger.debug("Getting random place")

	place=random.choice(places)

	logger.debug("Got random place %s" % (place))
	logger.debug("Concatenating quote")

	quote="Grab %s, %s, and %s, and meet me %s!" % (
		o[0].strip(),
		o[1].strip(),
		o[2].strip(),
		place.strip()
	)

	logger.info("Concatenated quote: %s" % (quote))

	return quote

def usage():
	print "Usage: [options] %s <objectfile> <placefile>" % (sys.argv[0])
	print "--loglevel <level>"
	print "-h --help (usage)"

	sys.exit()

def main():
	global objects
	global places
	global logger

	systemArgs=sys.argv[1:] # ignore program name

	objectfile="objects.txt"
	placefile="places.txt"
	loglevel=logging.INFO

	optlist, args=[], []
	try:
		optlist, args=getopt(systemArgs, "h", ["loglevel=", "help"])
	except:
		usage()

	for option, value in optlist:
		if option=="-h" or option=="--help":
			usage()
		elif option=="--loglevel":
			try:
				loglevel=int(value)
				if loglevel<logging.NOTSET or loglevel>logging.CRITICAL:
					raise Exception
			except:
				raise Exception("Loglevel is an integer from 0 to 50")

	if len(args)==2:
		objectfile, placefile=args

	setLogLevel(loglevel)

	loadQuotes(objectfile, placefile)

	quote=getQuote()

	print quote

if __name__=="__main__":
	main()
