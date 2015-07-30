#!/usr/bin/env python3

"""Print line numbers"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "8 Oct 2005"
__copyright__ = "Copyright 2005 Andrew Pennebaker"
__version__ = "0.2"


def show_numbers(file, start=1, end=0):
    """Prints line numbers for text files from start to end
    (omit end or use 0 for start to EOF)."""

    if end != 0 and end < start:
        print("Error: End is after start.")
        return

    f = open(file, "r")

    number = 1
    line = f.readline()

    while len(line) > 0 and (end == 0 or number <= end):
        if (number >= start):
            print("%d\t%s" % (number, line))

        line = f.readline()
        number += 1

    f.close()
