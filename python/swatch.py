#!/usr/bin/env python3

"""Swatch time / Internet time"""

# Andrew Pennebaker
# Copyright 2007 Andrew Pennebaker
#
# Credits:
# http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

import time

def beats():
  """Swatch beats"""

  t = time.gmtime()
  h, m, s = t.tm_hour, t.tm_min, t.tm_sec

  utc = 3600 * h + 60 * m + s # UTC

  bmt = utc + 3600 # Biel Mean Time (BMT)

  beat = bmt / 86.4

  if beat > 1000:
    beat -= 1000

  return beat

def swatch():
  """Swatch time"""
  return "@%06.2f" % (beats())

if __name__ == "__main__":
  print(swatch())
