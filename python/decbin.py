#!/usr/bin/env python3

"""Converts decimal numbers to binary by division.
Thanks go to Eric Nygren (nygrene@stcsc.edu)."""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "9 Oct 2005 - 8 Nov 2005"
__copyright__ = "Copyright 2005 Andrew Pennebaker"


def convert(decimal):
    """Convert and print a decimal number in binary"""

    if decimal == 0:
        print("0000")
        return

    binary = ""
    while decimal > 0:
        # append remainders in reverse order
        binary = "%d%s" % (decimal % 2, binary)
        decimal /= 2

    # nibble form
    if len(binary) % 4 != 0:
        binary = "%s%s" % ("0" * (4 - len(binary) % 4), binary)

    print(binary)
