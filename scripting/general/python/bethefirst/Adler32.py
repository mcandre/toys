#!/usr/bin/env python

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '21 Dec, 2005 - 17 Jul 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'
__version__ = '0.3'
__URL__ = 'http://snippets.dzone.com/posts/show/2889'

import HashFunction


class Adler32(HashFunction.HashFunction):
    BLOCK_SIZE = 1
    DIGEST_SIZE = 2

    INIT = 0x0001
    SUM_REQ = 'Sum >= 0'

    BASE = 65521

    TEST_DATA = 'abc'
    TEST_HASH = 0x24d0127

    def __init__(self, sum=0x0001):
        HashFunction.HashFunction.__init__()

        self.sum = sum

    def sumValid(self, sum):
        return sum >= 0

    def _update(self, b):
        s1 = self.sum & 0xffff
        s2 = (self.sum >> 16) & 0xffff

        s1 = (s1 + (b & 0xff)) % self.BASE
        s2 = (s1 + s2) % self.BASE

        self.sum = (s2 << 16) | s1

    def digest(self):
        return self.sum

    def format(self, data):
        return '%02x' % (data)

    def unformat(self, hash):
        return int(hash, 16)

if __name__ == '__main__':
    HashFunction.main(Adler32)
