#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="9 Dec 2006 - 7 Aug 2007"
__copyright__="Copyright 2006 2007 Andrew Pennebaker"
__version__="0.0.1"
__credits__="Based on Yubnub for Windows (http://www.opbarnes.com/blog/Programming/OPB/Utilities/yubnub.html)"
__URL__="http://snippets.dzone.com/posts/show/3120"

from html2txt import html2txt

import webbrowser
from urllib import urlopen

import sys
from getopt import getopt

PARSER="http://yubnub.org/parser/parse?command="

BROWSER_MODE="BROWSER"
PLAIN_MODE="PLAIN"

def space2plus(s):
	return "+".join(s.split())

def yubnub(command=""):
	global PARSER

	return PARSER+space2plus(command)

def yubnubBrowser(command):
	return webbrowser.open(yubnub(command))

def cleanHTML(html):
	h=html2txt()
	h.feed(html)
	h.close()

	return h.output()

def yubnubPlain(command, clean=True):
	command=yubnub(command)

	try:
		url=urlopen(command)
		lines=url.readlines()
		url.close()

		lines="".join(lines)

		if clean:
			return cleanHTML(lines)

		return lines

	except IOError:
		return Exception("Error connecting to "+command)

def usage():
	print "Usage: "+sys.argv[0]+" [options] <command>"
	print "-b --browser\n\tdefault mode"
	print "\n=p --plain\n\toutputs page contents"
	print "\t-c --clean\n\treplaces htmlencoded text with natural text"
	print "\t-d --dirty\n\traw html text"
	print "\n--parser <parser>\n\tcustomize parser URL"
	print "\n-h --help"

	sys.exit()

def main():
	global PARSER

	global BROWSER_MODE
	global PLAIN_MODE

	mode=BROWSER_MODE
	clean=True

	systemArgs=sys.argv[1:]
	optlist, args=[], []
	try:
		optlist, args=getopt(systemArgs, "bphcd", ["browser", "plain", "clean", "dirty", "help"])
	except:
		usage()

	for option, value in optlist:
		if option=="-h" or option=="--help":
			usage()

		elif option=="-b" or option=="--browser":
			mode=BROWSER_MODE
		elif option=="-p" or option=="--plain":
			mode=PLAIN_MODE
		elif option=="-c" or option=="--clean":
			clean=True
		elif option=="-d" or option=="--dirty":
			clean=False

	command=" ".join(args)

	if mode==BROWSER_MODE:
		yubnubBrowser(command)
	elif mode==PLAIN_MODE:
		for line in yubnubPlain(command, clean):
			sys.stdout.write(line)
		print ""

if __name__=="__main__":
	main()