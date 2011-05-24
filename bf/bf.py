#!/usr/bin/env python

"""A Brainfuck interpreter"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="18 Nov 2005 - 6 Jul 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.5"
__URL__="http://snippets.dzone.com/posts/show/3536"

import sys, os, getopt

tape=[0]*100
address=0

def sublevel(level):
	i=0

	if level.count("[")>level.count("]"):
		raise Exception("Unmatched Bracket")

	while level[0:i+1].count("[")!=level[0:i+1].count("]"):
		i+=1

	return level[1:i+1]

def run(code, position=0):
	global tape
	global address

	while position<len(code):
		cmd=code[position]

		if cmd=="<":
			address-=1
		elif cmd==">":
			address+=1
		elif cmd=="+":
			tape[address]+=1
		elif cmd=="-":
			tape[address]-=1
		elif cmd==".":
			sys.stdout.write(chr(tape[address]))
		elif cmd==",":
			try:
				tape[address]=ord(sys.stdin.read(1))
			except:
				tape[address]=-1
		elif cmd=="[":
			try:
				level=sublevel(code[position:])

				while tape[address]!=0:
					run(level)

				position+=len(level)

			except:
				return position
		elif cmd=="]":
			return position

		position+=1

	return position

def usage():
	print "Usage: %s [options] [<sourcefile>]" % (sys.argv[0])
	print "-h|--help (usage)"

	sys.exit()

def main():
	systemArgs=sys.argv[1:]

	live=False

	optlist, args=[], []

	try:
		optlist, args=getopt.getopt(systemArgs, "h", ["help"])
	except Exception, e:
		usage()

	live=len(args)<1

	for option, value in optlist:
		if option=="-h" or option=="--help":
			usage()

	if live:
		print "--BF Interpreter 0.5--"
		print "  Type exit to exit."

		code=""
		position=0

		line="not exit"
		while line!="exit":
			sys.stdout.write("% ")
			line=sys.stdin.readline().rstrip(os.linesep)
			code+=line

			position=run(code, position)
	else:
		src=args[0]

		srcfile=open(src, "r")
		code="".join(srcfile.readlines())
		srcfile.close()

		if code.count("[")!=code.count("]"):
			raise "Unbalanced brackets"
		else:
			run(code)

if __name__=="__main__":
	try:
		main()
	except KeyboardInterrupt, e:
		pass