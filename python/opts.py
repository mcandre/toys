#!/usr/bin/env python3

"""Getopt demo"""

import sys
import getopt


def usage():
    """Print usage message"""

    print("Usage: %s [options]" % (sys.argv[0]))
    print("-a ambulate")
    print("-b bumble")
    print("-c custom")
    print("--run walk at a fast pace")
    print("--float walk above the ground")
    print("--Float <file> (float above a file)")
    print("-u usage")

    sys.exit()


def main():
    """CLI"""

    optlist, args = getopt.getopt(
        sys.argv[1:],
        "abc:u",
        ["run", "float", "Float="]
    )

    if len(optlist) < 1:
        usage()

    for option, value in optlist:
        if option == "-u":
            usage()
        elif option == "-a":
            print("ambulating")
        elif option == "-b":
            print("bumbling")
        elif option == "-c":
            print(value)
        elif option == "--run":
            print("running")
        elif option == "--float":
            print("floating")
        elif option == "--Float":
            print("Floating above %s" % (value))

    for arg in args:
        print("additional argument %s" % (arg))

if __name__ == "__main__":
    main()
