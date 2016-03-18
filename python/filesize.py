#!/usr/bin/env python3

'''Get file size in bytes'''

import sys
from contracts import *


@contract(filename='str')
def get_size(filename):
    '''Calculate file size in bytes'''

    with open(filename, 'rb') as f:
        b = 0

        c = f.read(1)

        while c != '':
            b += 1
            c = f.read(1)

    return b


def usage():
    '''Print usage message'''

    print('Usage: %s file' % (sys.argv[0]))
    sys.exit()


def main():
    '''Print a file's size'''

    if len(sys.argv) < 2:
        usage()

    size = 0

    try:
        size = get_size(sys.argv[1])
    except Exception:
        raise Exception('Could not open %s' % (sys.argv[1]))

    print('%d bytes' % (size))

if __name__ == '__main__':
    main()
