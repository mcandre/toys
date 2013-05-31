#!/usr/bin/env python

"""Kindle root password decrypter"""

# Based on MobileRead
# http://www.mobileread.com/forums/showthread.php?p=1873256

import hashlib
import sys

# Common Kindle root passwords:
# mario
# fiona1776
# fiona177

def kindle_root_password(serial):
  """Derive root password from Kindle serial number"""

  serial_prime = "".join(serial.split(" "))
  serial_double_prime = serial_prime + "\n"

  return "fiona" + hashlib.md5(
    (serial_double_prime).encode("utf-8")
  ).hexdigest()[7:11]

def usage():
  """Print usage message"""

  print("Usage: %s <serial>" % sys.argv[0])

def main():
  """CLI"""

  if len(sys.argv) < 2:
    usage()
  else:
    serial = sys.argv[1]
    print(kindle_root_password(serial))

if __name__ == "__main__":
  main()
