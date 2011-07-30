#!/usr/bin/env python

"""A Python version of netcat."""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="12 Nov 2005 - 12 Feb 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"
__version__="0.2"

from socket import *

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

from makerange import makerange

import os, sys
from getopt import getopt

GAPING_SECURITY_HOLE=False
BUFFER=1024

LISTEN_MODE="LISTEN"
CONNECT_MODE="CONNECT"
SCAN_MODE="SCAN"

def listen(host="localhost", port=4000, family=FAMILIES["inet"], t=TYPES["tcp"], command="", key=None, cert=None):
	if family==FAMILIES["inet6"] and (not has_ipv6):
		raise Exception, "Platform does not support IPv6"

	server=socket(family, t)
	if key and cert:
		server.ssl(key, cert)
	server.bind((host, port))
	server.listen(1) # one connection at a time

	while True:
		(client, address)=server.accept()
		client.settimeout(1.0)
		isReceiving=True

		if GAPING_SECURITY_HOLE:
			proc=os.popen(command)
			proc.close()

		while isReceiving:
			data=client.recv(BUFFER)
			sys.stdout.write(data)
			isReceiving=len(data)>0

		client.close()

def connect(host, port=4000, family=FAMILIES["inet"], t=TYPES["tcp"], key=None, cert=None):
	if family==FAMILIES["inet6"] and (not has_ipv6):
		raise Exception, "Platform does not support IPv6"

	client=socket(family, t)
	if key and cert:
		client.ssl(key, cert)
	client.connect((host, port))
	isSending=True

	while isSending:
		data=sys.stdin.readline()
		client.send(data)
		isSending=len(data)>0

	client.close()

def scan(host="localhost", portrange=range(0, 25+1), family=FAMILIES["inet"], t=TYPES["tcp"]):
	if family==FAMILIES["inet6"] and (not has_ipv6):
		raise Exception, "Platform does not support IPv6"

	client=socket(family, t)

	o=[]

	while len(portrange)>0:
		# randomize port scan
		rand=os.urandom(2)
		index=(ord(rand[0])*256+ord(rand[1]))%len(portrange)

		try:
			client.connect((host, portrange[index]))
			client.close()
			o.append(portrange[index])
		except Exception:
			pass # ignore closed ports

		portrange.pop(index)

	return o

def usage():
	print "Usage: %s [options] <host>" % (sys.argv[0])
	print "\n--connect connect to server"
	print "--family [appletalk decnet inet inet6 ipx sna unix unspec]"
	print "--type [tcp udp rdm seq raw]"
	print "--port <range> (default 4000)"
	print "\n--listen create server"
	print "--execute <command> on listen\n\t\t\tonly executes if GAPING_SECURITY_HOLE is configured"
	print "\n--scan randomized ports for stealth"
	print "\n--sslkey <ssl key file>"
	print "--sslcert <ssl certificate file>"
	print "\n--help (usage)"

	sys.exit()

def main():
	global LISTEN_MODE
	global CONNECT_MODE
	global SCAN_MODE

	mode=CONNECT_MODE
	host="localhost"
	family=FAMILIES["inet"]
	t=TYPES["tcp"]
	ports=range(0, 300+1)
	command=""
	sslkey=None
	sslcert=None

	systemArgs=sys.argv[1:] # ignore program name
	optlist=[]
	args=[]

	try:
		optlist, args=getopt(
			systemArgs,
			"",
			[
				"connect",
				"listen",
				"scan",
				"family=",
				"type=",
				"port=",
				"execute=",
				"sslkey=",
				"sslcert=",
				"help"
			]
		)
	except Exception:
		usage()

	if len(optlist)<1 and len(args)<1:
		usage()

	for option, value in optlist:
		if option=="--help":
			usage()
		elif option=="--connect":
			mode=CONNECT_MODE
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
				usage()
		elif option=="--listen":
			mode=LISTEN_MODE
		elif option=="--execute":
			if not GAPING_SECURITY_HOLE:
				raise Exception, "GAPING_SECURITY_HOLE not configured to allow command execution"
		elif option=="--scan":
			mode=SCAN_MODE
		elif option=="--sslkey":
			sslkey=open(value, "r")
		elif option=="--sslcert":
			sslcert=open(value, "r")

	if mode==LISTEN_MODE:
		listen(host, ports[0], family, t, command, sslkey, sslcert)
	elif mode==CONNECT_MODE:
		connect(host, ports[0], family, t, sslkey, sslcert)
	elif mode==SCAN_MODE:
		openports=scan(host, ports, family, t)
		if len(openports)<1:
			print "no open ports found"
		else:
			for port in openports:
				print "%d open" % (port)

if __name__=="__main__":
	main()