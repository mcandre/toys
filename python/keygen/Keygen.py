#!/usr/bin/env python

import sys
from getopt import getopt

class Keygen:
	GENERATE_MODE="GENERATE"
	VERIFY_MODE="VERIFY"
	TEST_MODE="TEST"

	STATIC=[] # Any static keys

	def __init__(self):
		pass

	def _generate(self):
		return 0

	def format(self, num):
		return "%d" % (num)

	def unformat(self, s):
		return int(s)

	def generate(self):
		return self.format(self._generate())

	def _verify(self, num):
		return num==0

	def verify(self, num):
		return num in self.STATIC or self._verify(num)

	def test(self):
		numKey=self.generate()
		formattedKey=self.format(numKey)
		unformattedKey=self.unformat(formattedKey)

		if self.verify(unformattedKey):
			return "Passed"
		else:
			return "Failed: "+[numKey, formattedKey, unformattedKey]

	def usage(self):
		print "Usage: "+sys.argv[0]+" [options]"
		print "-g --generate"
		print "-n --no-static (default is yes)"
		print "-r --random"
		print "-v --verify <key>"
		print "-t --test"
		print "-h --help"

		sys.exit()

	def main(self):
		systemArgs=sys.argv[1:]

		mode=self.GENERATE_MODE
		key="0"
		static=True

		optlist = []

		try:
			optlist, args=getopt(systemArgs, "gnv:th", ["generate", "no-static", "verify=", "test", "help"])
		except:
			self.usage()

		for option, value in optlist:
			if option=="-h" or option=="--help":
				self.usage()

			elif option=="-g" or option=="--generate":
				mode=self.GENERATE_MODE
			elif option=="-n" or option=="--no-static":
				static=False
			elif option=="-v" or option=="--verify":
				mode=self.VERIFY_MODE
				key=value
			elif option=="-t" or option=="--test":
				mode=self.TEST_MODE

		if mode==self.GENERATE_MODE:
			if static:
				print "Static keys:\n"
				for key in self.STATIC:
					print self.format(key)
				print ""

			print "Random key:\n"
			print self.generate()
		elif mode==self.VERIFY_MODE:
			valid=self.verify(self.unformat(key))
			if valid:
				print "Valid"
			else:
				print "Invalid"
		elif mode==self.TEST_MODE:
			print self.test()