#!/usr/bin/env python

"""Connects to a TCP echo server (not necessarily echoserver.py)."""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="11 Nov 2005"
__copyright__="Copyright 2005 Andrew Pennebaker"
__version__="0.1"

from socket import *

import sys

from echoconstants import *

def start(host="localhost", port=8000):
	client=socket(AF_INET, SOCK_STREAM)

	try:
		print "connecting to %s at %d" % (host, port)
		client.connect((host, port))
		print "connected"
	except Exception, e:
		raise e

	print "Sent text, %s to quit." % (EXIT)

	data=raw_input("client> ")
	try:
		client.send(data)
		data=client.recv(BUFFER)
		print "server> %s" % (data)
		while data != EXIT and data != SHUTDOWN:
			data=raw_input("client> ")
			client.send(data)
			data=client.recv(BUFFER)
			print "server> %s" % (data)

		print "closing connection"
		client.close()
		print "closed"

	except Exception, e:
		raise e

if __name__=="__main__":
	if len(sys.argv)>2:
		start(sys.argv[1], int(sys.argv[2]))
	else:
		start()