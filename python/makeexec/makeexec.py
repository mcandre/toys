#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="3 Apr 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"

import sys
from getopt import getopt

interpreters={
	"py":"#!/usr/bin/env python",
	"pl":"#!/usr/bin/env perl",
	"pm":"#!/usr/bin/env perl",
	"lua":"#!/usr/bin/env lua",
	"sh":"#!/usr/bin/env sh",
	"rb":"#!/usr/bin/env ruby"
}

def update():
	global interpreters

	try:
		f=open("paths.conf", "r")
		options=("".join(f.readlines())).split("\n")

		interpreters={}

		for option in options:
			key, value=option.split(":")
			interpreters[key]=value
	except Exception:
		pass

def getExtension(filename):
	try:
		return filename[filename.rindex(".")+1:]
	except Exception:
		return ""

def makeexec(filename, manual=None):
	global interpreters

	auto=None

	if manual:
		auto=manual
	else:
		try:
			auto=interpreters[getExtension(filename)]
		except KeyError:
			raise Exception("Cannot guess interpreter. Specify manual path.")

	f=None

	try:
		f=open(filename, "r")
	except IOError:
		raise Exception("Error reading %s" % (filename))

	lines=("".join(f.readlines())).split("\n")
	f.close()

	if lines[0]!=auto:
		try:
			f=open(filename, "w")
		except IOError:
			raise Exception("Error writing to %s" % (filename))

		f.write("%s\n\n" % (auto))

		for line in lines:
			f.write("%s\n" % (line))

		f.close()

def usage():
	print "Usage: %s [options] <file1> <file2> <file3> <...>" % (sys.argv[0])
	print "\n--manual <interpreter path>"
	print "--help (usage)"

	sys.exit()

def main():
	systemArgs=sys.argv[1:] # ignore program name

	manual=None

	optlist=[]
	args=[]

	try:
		optlist, args=getopt(systemArgs, "", ["manual=", "help"])
	except Exception:
		usage()

	if len(args)<1:
		usage()

	for option, value in optlist:
		if option=="--help":
			usage()

		elif option=="--manual":
			manual=value

	for fn in args:
		makeexec(fn, manual)

if __name__=="__main__":
	main()

update()