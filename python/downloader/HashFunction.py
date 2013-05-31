#!/usr/bin/env python

"""Generic hash function interface"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "21 Dec 2005 - 11 Dec 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.3"
__URL__ = "http://snippets.dzone.com/posts/show/2888"

import getopt
import sys

TEST_MODE = "TEST"
HASH_MODE = "HASH"

class HashFunction:
  """Base class for hash functions"""

  OK = "OK"

  # bytes
  BLOCK_SIZE = 1
  DIGEST_SIZE = 1

  INIT = 0x00
  SUM_REQ = "Sum >= 0"

  TEST_DATA = "abc"
  TEST_HASH = 0x26

  def __init__(self, sum = 0x00):
    """Sets the context to some initial sum"""
    self.sum = sum & 0xff

  def sum_valid(self, sum):
    return sum >= 0

  def _update(self, b):
    """Data is an array of bytes"""

    self.sum = (self.sum+b) & 0xff

  def update(self, data):
    """Helper for _update(). Data is a string."""

    for byte in data:
      self._update(ord(byte))

  def digest(self):
    """Returns an integer or long integer"""

    return self.sum

  def format(self, data):
    """Format sum"""

    return "%02x" % (data)

  def format_digest(self):
    """Returns a formatted string, different for each algorithm"""

    return self.format(self.digest())

  def unformat_digest(self, hash):
    """Converts formatted hash into integer"""

    return int(hash, 16)

  def reset(self):
    """Reinitializes the hash"""

    self.__init__()

  def test(self):
    """Test system"""

    self.reset()
    self.update(self.TEST_DATA)
    hash = self.digest()
    formatted_hash = self.format(hash)
    unformatted_hash = self.unformat(formatted_hash)

    if unformatted_hash == self.TEST_HASH:
      return "OK"

    return {
      "test data":self.TEST_DATA,
      "test formatted hash":self.format(self.TEST_HASH),
      "resultant formatted hash":formatted_hash
    }

def usage():
  """Print usage message"""

  print "Usage: %s [options] <file1 file2 file3 ... >" % (sys.argv[0])
  print "\n-s --sum <sum>"
  print "-t --test engine"
  print "-h --help usage"

  sys.exit()

def main(hasher = HashFunction):
  """Load file, calculate, and print hash"""

  system_args = sys.argv[1:] # ignore program name

  mode = HASH_MODE
  sum = hasher.INIT

  optlist, args = [], []
  try:
    optlist, args = getopt.getopt(system_args, "s:th", ["sum=", "test", "help"])
  except getopt.GetoptError, e:
    usage()

  if len(optlist) < 1 and len(args) < 1:
    usage()

  for option, value in optlist:
    if option == "-h" or option == "--help":
      usage()
    elif option == "-t" or option == "--test":
      mode = TEST_MODE
    elif option == "-s" or option == "--sum":
      sum = hasher.unformat_digest(value)

      if not hasher.sum_valid(sum):
        raise "Requires: %s" % (hasher.SUM_REQ)

  hasher = hasher()

  if mode == TEST_MODE:
    result = hasher.test()

    if result == hasher.OK:
      print result
    else:
      print("test data: " + result["test data"])
      print("test formatted hash: " + result["test formatted hash"])
      print("resultant formatted hash: " + result["resultant formatted hash"])
  elif mode == HASH_MODE:
    for file in args:
      f = None

      try:
        f = open(file, "rb")
      except Exception, e:
        print "Could not open %s" % (file)
      else:
        hasher.reset()

        for line in f:
          hasher.update(line)
          f.close()

      print hasher.format_digest()

if __name__ == "__main__":
  main(HashFunction, "HashFunction.py")
