#!/usr/bin/env python

'''FizzBuzz'''

# Backwards compatibility with Python 2;
# Python 3 allows print() in lambdas.
from __future__ import print_function

import multiprocessing
from contracts import *


@contract(n='int')
def fizzbuzz(n):
    '''FizzBuzz value of a given number'''

    x, y = n % 3, n % 5

    if (x, y) == (0, 0):
        return 'FizzBuzz'
    elif x == 0:
        return 'Fizz'
    elif y == 0:
        return 'Buzz'
    else:
        return str(n)


def main():
    '''Print FizzBuzz series'''

    p = multiprocessing.Pool()

    for s in p.map(
        fizzbuzz,
        range(1, 100)
    ):
        print(s)

if __name__ == '__main__':
    main()
