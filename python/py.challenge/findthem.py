#!/usr/bin/env python

"""findthem.py"""

import sys

def findthem(line, threshhold):
	rare={}
	scores=total(line)
	for i in range(len(scores)):
		if scores[i]!=0 and scores[i]<threshhold:
			rare[chr(i)]=scores[i]

	return rare

def total(line):
	result=[0]*256

	for char in line:
		result[ord(char)]+=1

	return result

def main():
	f=open(sys.argv[1], "r")

	oneline="\n".join(f.readlines())

	findings=findthem(oneline, int(sys.argv[2]))

	rarejoin=", ".join(["%s:%d" % (key, findings[key]) for key in findings])

	print "Rare: %s" % (rarejoin)

if __name__=="__main__":
	main()
