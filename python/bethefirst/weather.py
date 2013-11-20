#!/usr/bin/env python

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "14 Feb 2007"
__copyright__ = "Copyright 2007 Andrew Pennebaker"

import downloader
from Adler32 import Adler32

import time
import os
import socket

PAGE_URL = "http://www.gmu.edu"
SEARCH_STRING = "Today at Mason"
MEDIA_PLAYER = "beep-media-player"
SONG = "song 2.ogg"

def message(text = ""):
  print "[%s] %s" % (time.asctime(), text)

def main():
  global PAGE_URL
  global SEARCH_STRING
  global MEDIA_PLAYER
  global SONG

  hasUpdated = False
  firstHash = None
  currentHash = firstHash

  hasher = Adler32()

  while (not hasUpdated):
    time.sleep(1) # seconds

    try:
      message("checking page")

      down = downloader.createDownload(PAGE_URL)
      instream = down[0]
      outstream = open(os.getcwd() + os.sep + down[1], "wb")

      line = instream.readline()
      while line != "":
        if SEARCH_STRING in line:
          break
        hasher.update(line)
        outstream.write(line)
        line = instream.readline()
      instream.close()
      outstream.close()

      if firstHash is None:
        currentHash = firstHash = hasher.formatDigest()
        message("first hash: " + firstHash)
      else:
        currentHash = hasher.formatDigest()

      hasher.reset()

      hasUpdated = (firstHash != currentHash)
      if not hasUpdated:
        message("static")
    except IOError, e:
      message("connection error")
    except Exception, e:
      message(e)

  message("detected update")
  message("alerting")

  os.popen(MEDIA_PLAYER + " \"" + os.getcwd() + os.sep + SONG + "\"")

  message("alerted")

if __name__ == "__main__":
  main()
