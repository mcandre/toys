#!/usr/bin/env python

"""Alarm sounder"""

import time, os, sys

def alert():
  """Alert using OS-configured audio file"""
  os.popen("open nads.wav")

if __name__ == "__main__":
  SECS = int(sys.argv[1])

  START = time.time()

  while time.time() - START < SECS:
    pass

  alert()

  sys.exit()
