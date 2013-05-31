"""Generic playing card interface"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "1 Jan 2006 - 6 Apr 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"

class Card:
  def __init__(self):
    pass

  def compare(self, other):
    return self.__class__ == other.__class__

  def __str__(self):
    pass
