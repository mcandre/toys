#!/usr/bin/env python

"""Accepts TCP connections and echoes back input.
Warning: uses SHUTDOWN command in echoconstants.py."""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="11 Nov 2005 - 12 Nov 2005"
__copyright__="Copyright 2005 Andrew Pennebaker"
__version__="0.2"

import sys

from Rot13Socket import *
from echoconstants import *

def start(host="localhost", port=8000):
	server=Rot13Socket(AF_INET, SOCK_STREAM)

	if host is not "localhost":
		host=gethostname()

	try:
		print "binding to %s at %d" % (host, port)
		server.bind((host, port))
		print "bound"
	except Exception, e:
		raise e

	print "listening for connections"
	server.listen(5) # permits 5 threaded connections
	listening=True

	while listening:
		try:
			print "accepting connections"
			(client, address)=server.accept()
			print "accepted connection to %s" % (address[0])

			data=client.recv(BUFFER)
			print "received: %s" % (data)
			client.send(data)
			while data != EXIT and data != SHUTDOWN:
				data=client.recv(BUFFER)
				print "received: %s" % (data)
				client.send(data)

			print "disconnecting from %s" % (address[0])
			client.close()
			print "disconnected"

			if data==SHUTDOWN:
				print "closing server"
				server.close()
				print "closed"
				listening=False

		except Exception, e:
			print "error: %s" % (e)

if __name__=="__main__":
	if len(sys.argv)>2:
		start(sys.argv[1], int(sys.argv[2]))
	else:
		start()