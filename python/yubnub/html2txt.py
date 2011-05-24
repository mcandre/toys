#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="10 Dec 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.0.1"
__credits__="Based on http://mail.python.org/pipermail/python-list/2004-November/291562.html"
__URL__="http://snippets.dzone.com/posts/show/3127"

import htmllib
from sgmllib import SGMLParser

import sys

class html2txt(SGMLParser):
	"""html2txt()"""

	def reset(self):
		SGMLParser.reset(self)
		self.pieces=[]

	def handle_data(self, text):
		self.pieces.append(text)

	def unknown_starttag(self, tag, attributes):
		pass

	def unknown_endtag(self, tag):
		pass

	def handle_entityref(self, ref):
		try:
			self.pieces.append(htmllib.HTMLParser.entitydefs[ref])
		except KeyError, e:
			self.pieces.append("&"+ref)

	def output(self):
		return "".join(self.pieces)

if __name__=="__main__":
	html="".join(sys.stdin.readlines())

	parser=html2txt()
	parser.feed(html)
	parser.close()

	print parser.output()