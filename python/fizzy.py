#!/usr/bin/env python

# Backwards compatibility with Python 2;
# Python 3 allows print() in lambdas.
from __future__ import print_function

import multiprocessing

def fizzbuzz(n):
    x, y = n % 3, n % 5

    if (x, y) == (0, 0):
        return "FizzBuzz"
    elif x == 0:
        return "Fizz"
    elif y == 0:
        return "Buzz"
    else:
        return str(n)

def main():
    p = multiprocessing.Pool()

    map(
        (lambda s: print(s)),
        p.map(
            fizzbuzz,
            range(1, 100)
        )
    )

if __name__=="__main__":
    main()
