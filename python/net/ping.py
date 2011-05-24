#!/usr/bin/env python

"""Based on ping2.py by Ray Burr (ryb@nightmare.com)"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="27 Nov 2005 - 22 Jun 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.3"

import os
import select
import socket
import sys

import time
from getopt import getopt

ETH_P_IP=0x0800
ETH_P_ALL=0x0003
SOCK_PACKET=10
IPPROTO_ICMP=1

ICMP_ECHOREPLY=0
ICMP_DEST_UNREACH=3
ICMP_SOURCE_QUENCH=4
ICMP_ECHO=8
ICMP_TIME_EXCEEDED=11

NULL_REPLY=(False, -1, "")
INFINITE="INFINITE"
status={
	True:"up",
	False:"down"
}

def encodeShort(num):
	"""Converts short to 2-character string"""

	return chr(num/256)+chr(num%256)

def decodeShort(s):
	"""Converts 2-character string to short"""

	return ord(s[0])*256+ord(s[1])

def encodeLong(num):
	"""Converts long to 4-character string"""

	return encodeShort(num/65536)+encodeShort(num%65536)

def decodeLong(s):
	"""Converts 4-character string to long"""

	try:
		return decodeShort(s[0:2])*65536+decodeShort(s[2:4])
	except OverflowError, e:
		return -1

def encodeAddr(dotStr):
	"""Converts dotted-octet into a four-character string"""
	s=[]

	for x in string.splitfields(dotStr, "."):
		s.append(chr(int(x)))

	return "".join(s)

def decodeAddr(fourChar):
	"""Converts four-character string into dotted-octet"""
	s=[]

	for x in fourChar:
		s.append(ord(x))

	return ".".join(["%d" % (e) for e in s])

# borrowed from tcpdump
def checksum(data):
	state=0

	while data:
		state=state+(decodeShort(data[0:2])&0xffff)
		data=data[2:]
	while state>0xffff:
		state=(state&0xffff)+(state>>16) # increment in case of overflows

	return ~state&0xffff # invert and remove sign

def createICMPPacket(data):
	packet=(
		chr(ICMP_ECHO)+						# Type
		chr(0)+								# Code
		encodeShort(0)+						# Checksum
		encodeShort((os.getpid()&0xffff))+	# Identifier
		encodeShort(0)+						# Sequence Number
		data								# data
	)

	sum=checksum(packet)
	packet=packet[0:2]+encodeShort(sum)+packet[4:]

	return packet

def dumpPacket(data):
	result=""

	col=-1
	while data:
		if col==0:
			result+="\n"
		elif col<0:
			col=0
		result+="%04x" % (decodeShort(data[:2]))
		result+=" "
		col=(col+1)%4
		data=data[2:]

	return result

def sendEchoRequest(s, destInetAddr, data):
	packet=createICMPPacket(data)
	s.sendto(packet, (destInetAddr, socket.AF_INET))

def catchEchoReply(s, otherAddr, ident, timeLimit):
	updown=True

	identString=encodeShort(ident)
	deadline=time.time()+timeLimit

	rdat=None
	addr=None

	while True:
		timeLeft=deadline-time.time()
		if timeLeft<=0:
			updown=False
			break
		fds=select.select([s], [], [], timeLeft)
		if not fds[0]:
			updown=False
			break

		rdat, addr=s.recvfrom(512)

		if addr[0]!=otherAddr:
			continue
		ihl=20
		if rdat[0]!="\x45":
			ihl=(rdat[0]&0x0f)*4
		if rdat[ihl]!="\x00":
			continue
		if rdat[ihl+4:ihl+6]!=identString:
			continue
		if checksum(rdat[ihl:])!=0:
			continue
		break

	return (updown, timeLimit-timeLeft, dumpPacket(rdat))

def ping(host, timeout=2, length=56, ttl=128):
	global NULL_REPLY

	destInetAddr=None
	try:
		destInetAddr=socket.gethostbyname(host)
	except socket.gaierror, e:
		return NULL_REPLY

	data="\x00"*length

	s=socket.socket(socket.AF_INET, socket.SOCK_RAW, IPPROTO_ICMP)
	s.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, ttl)

	sendEchoRequest(s, destInetAddr, data)

	return catchEchoReply(s, destInetAddr, (os.getpid()&0xffff), timeout)

def usage():
	print "Usage: %s [options] <host1 host2 host3 ...>" % (sys.argv[0])
	print "\n-w wait for timeout <seconds>"
	print "-l length <even bytes>"
	print "-t <ttl>"
	print "-n number <number>"
	print "-v verbose (dump packet)"
	print "-i interval <interval>"
	print "-h --help (usage)"

	sys.exit()

def main():
	global INFINITE
	global status

	systemArgs=sys.argv[1:] # ignore program name

	hosts=[]
	timeout=2
	length=56
	ttl=128
	number=INFINITE
	interval=0
	verbose=False

	optlist=[]
	args=[]

	try:
		optlist, args=getopt(systemArgs, "w:l:t:n:vi:h", ["help"])
	except Exception, e:
		usage()

	if len(args)<1:
		usage()

	for option, value in optlist:
		if option=="-h" or option=="--help":
			usage()

		elif option=="-w":
			try:
				timeout=int(value)
				if timeout<1:
					raise Exception
			except Exception, e:
				raise "Timeout must be positive"
		elif option=="-l":
			try:
				length=int(value)
				if length<1 or (length%2)!=0:
					raise Exception
			except Exception, e:
				raise "Length must be an even number >= 1"
		elif option=="-t":
			try:
				ttl=int(value)
				if ttl<0 or ttl>255:
					raise Exception
			except Exception, e:
				raise "TTL must be >= 1 and <= 255"
		elif option=="-n":
			try:
				number=int(value)
				if number<0:
					raise Exception
			except Exception, e:
				raise "Number must be >= 0"
		elif option=="-v":
			verbose=True
		elif option=="-i":
			try:
				interval=int(value)
				if interval<0:
					raise Exception
			except Exception, e:
				raise "Interval must be >= 0"

	hosts=args

	i=0
	while number==INFINITE or i<number:
		for host in hosts:
			updown, journey, packet=ping(host, timeout, length, ttl)
			print "%s up: %s %d ms" % (host, status[updown], journey)
			if verbose:
				print "Data:\n%s" % (packet)

		i+=1
		time.sleep(interval)

if __name__=="__main__":
	try:
		main()
	except KeyboardInterrupt, e:
		pass