#!/usr/bin/env python

"""Portscan by using socket.connect(). Family and type constants provided in part by http://pydoc.org/2.2.3/socket.html."""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com"
__date__="11 Nov 2005 - 12 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.2"

from makerange import makerange

from socket import *

import sys
from getopt import getopt

FAMILIES={
	"appletalk":5,
	"decnet":12,
	"inet":2,
	"inet6":23,
	"ipx":6,
	"sna":11,
	"unix":1,
	"unspec":0
}

TYPES={
	"tcp":1,
	"udp":2,
	"rdm":4,
	"seq":5,
	"raw":3
}

def scan(family=FAMILIES["inet"], t=TYPES["tcp"], address="localhost", portrange=range(0, 25+1), verbose=False):
	if family==FAMILIES["inet6"]:
		if not has_ipv6:
			raise Exception("Platform does not support IPv6")

	openports=[]

	if verbose:
		print "Creating socket"

	client=socket(family, t)

	for port in portrange:
		try:
			if verbose:
				print "Attempting to connect (%s:%d)" % (address, port)

			client.connect((address, port))

			if verbose:
				print "Connection made"

			client.close()

			if verbose:
				print "Connection closed"

			openports.append(port)
		except Exception:
			if verbose:
				print "Connection not made"

	return openports

def usage():
	print "%s [options] <host1 host2 host3 ...>" % (sys.argv[0])
	print "\n--family [appletalk decnet inet inet6 ipx sna unix unspec]"
	print "--type [tcp udp rdm seq raw]"
	print "--port <range> in the format:\n\t-20,80,100-200,40000-\n\t(0 to 20, 80, 100 to 200, 40000 to 65536)"
	print "--verbose show more information"
	print "--help (usage)"

	sys.exit()

def main():
	family=FAMILIES["inet"]
	t=TYPES["tcp"]
	hosts=[]
	ports=range(0, 300+1)
	v=False

	systemArgs=sys.argv[1:] # ignore program name
	optlist=[]
	args=[]

	try:
		optlist, args=getopt(systemArgs, "", ["family=", "type=", "port=", "verbose", "help"])
	except Exception, e:
		usage()

	if len(args)<1:
		usage()

	for option, value in optlist:
		if option=="--help":
			usage()
		elif option=="--family":
			if FAMILIES.has_key(value):
				family=FAMILIES[value]
			else:
				raise TypeError, "Family not valid"
		elif option=="--type":
			if TYPES.has_key(value):
				t=TYPES[value]
			else:
				raise TypeError, "Type not valid"
		elif option=="--port":
			try:
				ports=makerange(value)
			except Exception, e:
				raise e
				usage()
		elif option=="--verbose":
			v=True

	hosts=args

	print "Scanning"

	for host in hosts:
		print "%s:" % (host)

		portinfo=scan(family, t, host, ports, v)

		if len(portinfo)<1:
			print "no open ports found"
		else:
			for port in portinfo:
				print "%d open" % (port)

		print ""

if __name__=="__main__":
	main()