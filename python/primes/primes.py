#!/usr/bin/env python

"""Lists all primes"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "26 Nov 2005 - 12 Feb 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.2"

from factor import get_all_factors
from makerange import makerange

import sys
import getopt


def usage():
    """Print usage message"""
    print("Usage: %s <number/range> [--help]")
    sys.exit()


def main():
    """CLI"""

    system_args = sys.argv[1:]  # ignore program name
    optlist = []
    args = []

    if len(args) < 1:
        usage()

    try:
        optlist, args = getopt.getopt(system_args, None, ["help"])
    except getopt.GetoptError:
        usage()

    for option, value in optlist:
        if option == "--help":
            usage()

    numbers = makerange(args[0], 1, 10 ** 25)

    print("Factoring")

    for n in numbers:
        print(" ".join(get_all_factors(n)))

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
