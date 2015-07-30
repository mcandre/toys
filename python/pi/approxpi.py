#!/usr/bin/env python

"""Uses
            . b
4 lim      |    1/(x^2+1) dx
  b -> oo .   0

to approximate Pi"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "17 Jan 2006 - 12 Feb 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.1"

import math
import sys


def approxpi(b=1000):
    """Pi approximation"""
    return 2 * math.atan(b)


def usage():
    """Print usage message"""
    print("Usage: %s <large number>" % (sys.argv[0]))
    sys.exit()


def main():
    """CLI"""

    n = 1000

    n = int(sys.argv[1])

    if n < 0:
        usage()

    print(approxpi(n))

if __name__ == "__main__":
    main()
