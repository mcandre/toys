#!/usr/bin/env python

# Based on MobileRead
# http://www.mobileread.com/forums/showthread.php?p=1873256

import hashlib
import sys

# Common Kindle root passwords:
# mario
# fiona1776
# fiona177

def kindle_root_password(serial):
	serialPrime = "".join(serial.split(" "))
	serialDoublePrime = serialPrime + "\n"

	return ("fiona%s" % hashlib.md5((serialDoublePrime).encode("utf-8")).hexdigest()[7:11])

def usage():
	print("Usage: %s <serial>" % sys.argv[0])

def main():
	if len(sys.argv) < 2:
		usage()
	else:
		serial = sys.argv[1]
		print(kindle_root_password(serial))

if __name__=="__main__":
	main()
