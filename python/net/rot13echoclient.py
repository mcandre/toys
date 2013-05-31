#!/usr/bin/env python

"""Connects to a TCP echo server (not necessarily echoserver.py)."""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "11 Nov 2005 - 12 Nov 2005"
__copyright__ = "Copyright 2005 Andrew Pennebaker"
__version__ = "0.2"

import Rot13Socket
import echoconstants

import socket
import sys

def start(host = "localhost", port = 8000):
  """Start socket"""

  client = Rot13Socket.Rot13Socket(socket.AF_INET, socket.SOCK_STREAM)

  print "connecting to %s at %d" % (host, port)
  client.connect((host, port))
  print "connected"

  print "Sent text, %s to quit." % (echoconstants.EXIT)

  data = raw_input("client> ")

  client.send(data)
  data = client.recv(echoconstants.BUFFER)
  print "server> %s" % (data)
  while data != echoconstants.EXIT and data != echoconstants.SHUTDOWN:
    data = raw_input("client> ")
    client.send(data)
    data = client.recv(echoconstants.BUFFER)
    print "server> %s" % (data)

  print "closing connection"
  client.close()
  print "closed"

if __name__ == "__main__":
  if len(sys.argv) > 2:
    start(sys.argv[1], int(sys.argv[2]))
  else:
    start()
