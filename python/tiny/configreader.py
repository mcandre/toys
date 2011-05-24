#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="17 Dec 2006 - 24 Jun 2007"
__copyright__="Copyright 2006 2007 Andrew Pennebaker"
__version__="0.0.1"

def load(config, settings):
	"""Assumes settings already have defaults; ignores all IOErrors.
config is an iterable text stream."""

	try:
		for line in config:
			line=line.strip()

			if "#" in line:
				line=line[:line.index("#")]

			if line:
				key, value=line[:line.index("=")-1], line[line.index("=")+1:]

				settings[key.strip()]=eval(value)

		config.close()
	except IOError, e:
		return

def main():
	for name in sys.argv[1:]:
		d={}
		read(open(name, "r"), d)

		print str(d)+"\n"

if __name__=="__main__":
	main()