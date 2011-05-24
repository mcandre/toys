#!/usr/bin/env python

"""A Bullshit interpreter"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="27 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.5"

from aio import chomp

import sys
from getopt import getopt

tape=[0]*100
address=0

def sublevel(toplevel):
	i=0

	# until a balanced-bracket code block is found, add a character

	while toplevel[0:i+1].count("[")!=toplevel[0:i+1].count("]"): i+=1

	return toplevel[1:i]

def run(instructions):
	global tape
	global address

	position=0
	while position<len(instructions):
		cmd=instructions[position]

		if cmd=="<": address-=1
		elif cmd==">": address+=1
		elif cmd=="+": tape[address]+=1
		elif cmd=="-": tape[address]-=1
		elif cmd=="!": sys.stdout.write(chr(tape[address]))
		elif cmd=="?":
			try: tape[address]=ord(sys.stdin.read(1))
			except: tape[address]=-1
		elif cmd=="[":
			level=sublevel(instructions[position:])
			while tape[address]!=0: run(level)

			position+=len(level)+1

		position+=1

def usage():
	print "Usage: %s [options] <sourcefile>" % (sys.argv[0])
	print "--help (usage)"

	sys.exit()

def main():
	systemArgs=sys.argv[1:] # ignore program name

	live=False

	optlist=[]
	args=[]

	try:
		optlist, args=getopt(systemArgs, None, ["help"])
	except Exception, e:
		usage()

	live=len(args)<1

	for option, value in optlist:
		if option=="--help":
			usage()

	if live:
		print "--BF Interpreter 0.5--"
		print "  Type exit to exit."

		line="not exit"
		while line!="exit":
			sys.stdout.write("% ")
			line=chomp(sys.stdin.readline())

			if line.count("[")!=line.count("]"):
				raise "Unbalanced brackets"
			else:
				run(line)
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
