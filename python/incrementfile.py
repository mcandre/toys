#!/usr/bin/env python3

'''Increments numbers in file names.'''

import re

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '22 Oct 2005 - 23 Oct 2005'
__copyright__ = 'Copyright 2005 Andrew Pennebaker'
__version__ = '0.2'

SEARCHER = re.compile(r'(.*\D)*(\d+)(\D.*)*$')


def increment_range(filename, length):
    '''List increasing filenames'''

    filenames = [filename]

    for i in range(length):
        nextname = increment(filenames[i])
        filenames.append(nextname)

    return '\n'.join(filenames)


def increment(filename):
    '''Searches for last set of integer(s), and increments it.'''

    pre = ''
    numstring = ''
    end = ''

    m = SEARCHER.match(filename)

    if m:
        pre = m.group(1)
        numstring = m.group(2)
        end = m.group(3)
    else:
        raise TypeError('No numbers found.')

    newnum = '%d' % (int(numstring) + 1)

    zeros = ''.join('0' * len(numstring) - len(newnum))

    return '%s%s%s%s' % (pre, zeros, newnum, end)
