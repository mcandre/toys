#!/usr/bin/env python

"""Yet another Pi approximation"""

import sys
import getopt


def t(t, mult, div):
    """T calculation"""

    m = 2
    d = 3
    p = t
    s = t

    while p > 0:

        p = (p * mult / div) * m / d

        m += 2
        d += 2
        s += p

    return s


def usage():
    """Print usage message"""
    print(
        "Usage: %s [--n n] [--precision precision] [--help]" %
        (sys.argv[0])
    )
    sys.exit()


def main():
    """CLI"""
    system_args = sys.argv[1:]  # ignore program name

    po = 1L
    n = 90000L  # n = 4000

    optlist = []

    try:
        optlist, args = getopt.getopt(
            system_args,
            None,
            ["n=", "precision=", "help"]
        )
    except getopt.GetoptError:
        usage()

    for option, value in optlist:
        if option == "--help":
            usage()

        elif option == "--n":
            n = long(value)
            if n < 5:
                raise Exception("N is at least 1")
        elif option == "--precision":
            po = long(value)

            if po < 1:
                raise Exception("Precision is at least 1")

    for i in range(0, n - 5):
        po *= 10

    pi = t(280000 * po, 2, 100) + t(30336 * po, 144, 100000)

    print(pi)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
