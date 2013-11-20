#!/usr/bin/env python

"""Splits and joins files. Helpful when media can't fit a file.
Be prepared for a lot of output files!"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "6 Jan 3006 - 12 Feb 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.3"
__URL__ = "http://snippets.dzone.com/posts/show/3541"

import sys
import os
import getopt

SPLIT_MODE = "SPLIT"
JOIN_MODE = "JOIN"

def split_file(name, length, number):
  """Split a file into specified parts"""

  if length is None:
    infile = open(name, "rb")
    size = 0
    while infile.read(1) != "":
      size += 1

    infile.close()

    maxlength = size / number
    if number * maxlength < size:
      maxlength += 1
  else:
    if length < 1:
      raise Exception

  infile = open(name, "rb")

  i = 0
  j = 0
  c = infile.read(1)
  while c != "":
    outfile = open("%s.%d" % (name, j), "wb")

    while i < length and c != "":
      outfile.write(c)
      c = infile.read(1)
      i += 1

    outfile.close()
    i = 0
    j += 1

  infile.close()

def join_files(filenames):
  """Join files back together"""

  if len(filenames) < 1:
    raise Exception

  filenames.sort() # ...0 must be first

  original_filename = filenames[0][0:-2] # take ".0" off the first file name

  original_file = open(original_filename, "wb")

  c = "&" # dummy

  for filename in filenames:
    small_file = open(filename, "rb")

    c = small_file.read(1)
    while c != "":
      original_file.write(c)
      c = small_file.read(1)

    small_file.close()

  original_file.close()

def usage():
  """Print usage message"""

  print "Usage: %s [options] [files]" % (sys.argv[0])
  print "\n--split <file1 file 2 file 3...>"
  print "--join <dir1 dir2 dir3 ...>"
  print "--maxlength <bytes>"
  print "--maxfiles <number>"
  print "--help (usage)"

  sys.exit()

def main():
  """Split or join files as specified"""

  mode = SPLIT_MODE
  filenames = []
  maxlength = 1024
  maxfiles = None

  system_args = sys.argv[1:] # ignore program name

  optlist = []
  args = []

  try:
    optlist, args = getopt.getopt(
      system_args,
      "",
      ["split", "join", "maxlength=", "maxfiles=", "help"]
    )
  except getopt.GetoptError:
    usage()

  if len(optlist) < 1 or len(args) < 1:
    usage()

  for option, value in optlist:
    if option == "--help":
      usage()

    elif option == "--split":
      mode = SPLIT_MODE
    elif option == "--join":
      mode = JOIN_MODE
    elif option == "--maxlength":
      maxlength = int(value)

      if maxlength < 1:
        raise Exception("Length must be at least one")
    elif option == "--maxfiles":
      maxfiles = int(value)

      if maxfiles < 1:
        raise Exception("Number must be at least one")

  filenames = args

  if mode == SPLIT_MODE:
    for filename in filenames:
      split_file(filename, maxlength, maxfiles)

  elif mode == JOIN_MODE:
    for directory in filenames:
      files = ["%s%s%s" % (directory, os.sep, f) for f in os.listdir(directory)]

      join_files(files)

if __name__ == "__main__":
  main()
