#!/usr/bin/env python

"""Kenan Kel Quote generator"""
__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "6 May 2006 - 8 Aug 2007"
__copyright__ = "Copyright 2006 2007 Andrew Pennebaker"
__version__ = "0.1"

import logging
import random
import sys
import getopt

LOGGER = logging.getLogger("File")
FILE_HANDLER = logging.FileHandler("KenanKelQuote.log")
FORMATTER = logging.Formatter("%(asctime)s %(levelname)s %(message)r")
FILE_HANDLER.setFormatter(FORMATTER)
LOGGER.addHandler(FILE_HANDLER)
LOGGER.setLevel(logging.INFO)

OBJECTS = []
PLACES = []

def load_lines(filename):
  """Load funny lines from a text file into a list."""

  LOGGER.debug("Opening %s" % (filename))

  f = open(filename, "r")

  LOGGER.debug("Opened %s in read text mode" % (filename))
  LOGGER.debug("Reading lines")

  lines = ("".join(f.readlines())).split("\n")

  LOGGER.debug("Read lines")
  LOGGER.debug("Closing %s" % (filename))

  f.close()

  LOGGER.debug("Closed %s" % (filename))

  return lines

def load_quotes(objectfile = "objects.txt", placefile = "places.txt"):
  """Load funny items from text files."""

  global OBJECTS
  global PLACES

  try:
    LOGGER.debug("Loading object lines")

    OBJECTS = load_lines(objectfile)

    LOGGER.debug("Loaded object lines %s" % (OBJECTS))
    LOGGER.debug("Loading place lines")

    PLACES = load_lines(placefile)

    LOGGER.debug("Loaded place lines %s" % (PLACES))
  except:
    LOGGER.error("Error loading files")

    raise Exception("Error loading files")

  if len(OBJECTS) < 1 or len(PLACES) < 1:
    LOGGER.warn("Objects or places empty: %s %s" % (OBJECTS, PLACES))

def get_quote():
  """Generate random quote"""

  LOGGER.debug("Getting random objects")

  o = [random.choice(OBJECTS) for i in range(3)]

  LOGGER.debug("Got random objects: %s" % (o))
  LOGGER.debug("Getting random place")

  place = random.choice(PLACES)

  LOGGER.debug("Got random place %s" % (place))
  LOGGER.debug("Concatenating quote")

  quote = "Grab %s, %s, and %s, and meet me %s!" % (
    o[0].strip(),
    o[1].strip(),
    o[2].strip(),
    place.strip()
  )

  LOGGER.info("Concatenated quote: %s" % (quote))

  return quote

def usage():
  """Print usage message"""

  print "Usage: [options] %s <objectfile> <placefile>" % (sys.argv[0])
  print "--loglevel <level>"
  print "-h --help (usage)"

  sys.exit()

def main():
  """Print a random quote"""

  system_args = sys.argv[1:] # ignore program name

  objectfile = "objects.txt"
  placefile = "places.txt"
  loglevel = logging.INFO

  optlist, args = [], []
  try:
    optlist, args = getopt.getopt(system_args, "h", ["loglevel=", "help"])
  except getopt.GetoptError:
    usage()

  for option, value in optlist:
    if option == "-h" or option == "--help":
      usage()
    elif option == "--loglevel":
      try:
        loglevel = int(value)
        if loglevel < logging.NOTSET or loglevel > logging.CRITICAL:
          raise Exception
      except:
        raise Exception("Loglevel is an integer from 0 to 50")

  if len(args) == 2:
    objectfile, placefile = args

  LOGGER.setLevel(loglevel)

  load_quotes(objectfile, placefile)

  quote = get_quote()

  print quote

if __name__ == "__main__":
  try:
    main()
  except KeyboardInterrupt, e:
    pass
