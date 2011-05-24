#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="8 Jan 2007 - 11 May 2007"
__copyright__="Copyright 2007 Andrew Pennebaker"
__version__="0.0.1"

import sys

def read(configdata, settings):
	"""Assumes settings already has defaults, so ignores inability to read file."""

	if isinstance(configdata, file):
		temp="".join(configdata.readlines())
		configdata.close()
		configdata=temp

	try:
		for line in configdata.splitlines():
			line=line.strip()

			if "#" in line:
				line=line[:line.index("#")]

			if line:
				key, value=line.split("=")

				settings[key.strip()]=eval(value)
	except IOError, e:
		pass

def main():
	for name in sys.argv[1:]:
		d={}
		read(open(name, "r"), d)

		print str(d)+"\n"

if __name__=="__main__":
	main()