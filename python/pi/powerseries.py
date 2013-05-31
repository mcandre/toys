#!/usr/bin/env python

"""Uses

  oo
  --
4 >  (-1)^n / (2n+1)
  --
  n=0

with remainder < 1/(2n+3)

to approximate Pi"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "9 Feb 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.2"

from decimal import Decimal, getcontext

getcontext().prec = 1000

import sys
import getopt

def approxpi(n = 1000):
  """Power series approximation"""

  s = Decimal(0)
  x = 0
  while x <= n:
    s += Decimal((-1) ** x) / Decimal(2 * x + 1)
    x += 1

  pi = Decimal(4) * s

  remainder = Decimal(4) / Decimal(2 * n + 3)

  return (pi, remainder)

def usage():
  """Print usage message"""
  print("Usage: %s [--n n] [--help]" % (sys.argv[0]))
  sys.exit()

def main():
  """CLI"""
  system_args = sys.argv[1:] # ignore program name

  n = 1000

  optlist = []

  try:
    optlist, args = getopt.getopt(system_args, None, ["n=", "help"])
  except getopt.GetoptError:
    usage()

  for option, value in optlist:
    if option == "--help":
      usage()

    elif option == "--n":
      n = int(value)
      if n < 0:
        raise Exception("N must be at least 0")

  result = approxpi(n)

  print "Pi:\n%s\n" % (result[0])
  print "Remainder:\n%s" % (result[1])

if __name__ == "__main__":
  main()
