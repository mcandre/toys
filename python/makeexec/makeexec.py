#!/usr/bin/env python

"""Properly shebang and mark a file as executable"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "3 Apr 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"

import sys
import getopt

INTERPRETERS = {
  "py":"#!/usr/bin/env python",
  "pl":"#!/usr/bin/env perl",
  "pm":"#!/usr/bin/env perl",
  "lua":"#!/usr/bin/env lua",
  "sh":"#!/bin/sh",
  "rb":"#!/usr/bin/env ruby"
}

def update():
  """Update file"""

  global INTERPRETERS

  f = open("paths.conf", "r")
  options = ("".join(f.readlines())).split("\n")

  INTERPRETERS = {}

  for option in options:
    key, value = option.split(":")
    INTERPRETERS[key] = value

def get_extension(filename):
  """Get a file's extension"""

  return filename[filename.rindex(".")+1:]

def makeexec(filename, manual = None):
  """Make a file properly executable"""

  auto = None

  if manual:
    auto = manual
  else:
    try:
      auto = INTERPRETERS[get_extension(filename)]
    except KeyError:
      raise Exception("Cannot guess interpreter. Specify manual path.")

  f = None

  try:
    f = open(filename, "r")
  except IOError:
    raise Exception("Error reading %s" % (filename))

  lines = ("".join(f.readlines())).split("\n")
  f.close()

  if lines[0] != auto:
    try:
      f = open(filename, "w")
    except IOError:
      raise Exception("Error writing to %s" % (filename))

    f.write("%s\n\n" % (auto))

    for line in lines:
      f.write("%s\n" % (line))

    f.close()

def usage():
  """Print usage message"""

  print "Usage: %s [options] <file1> <file2> <file3> <...>" % (sys.argv[0])
  print "\n--manual <interpreter path>"
  print "--help (usage)"

  sys.exit()

def main():
  """CLI"""

  system_args = sys.argv[1:] # ignore program name

  manual = None

  optlist = []
  args = []

  try:
    optlist, args = getopt.getopt(system_args, "", ["manual=", "help"])
  except getopt.GetoptError:
    usage()

  if len(args) < 1:
    usage()

  for option, value in optlist:
    if option == "--help":
      usage()

    elif option == "--manual":
      manual = value

  for fn in args:
    makeexec(fn, manual)

if __name__ == "__main__":
  main()

update()
