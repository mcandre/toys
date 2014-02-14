#!/usr/bin/env python

import sys

def main():
  c = sys.stdin.read(1)

  while len(c) > 0:
    sys.stdout.write(c)
    c = sys.stdin.read(1)

if __name__ == "__main__": main()
