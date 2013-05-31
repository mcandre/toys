"""Go Bananas card"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "6 Apr 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"

from GoBananasCard import GoBananasCard

class BananaCard(GoBananasCard):
  FRESH = "Fresh"
  ROTTEN = "Rotten"

  def __init__(self, type):
    self.setType(type)
    self.setNumber(self.ZERO)

  def setType(self, type):
    self.type = type
    if type == self.FRESH:
      self.setColor(self.RED)
    else:
      self.setColor(self.BLUE)

  def getType(self):
    return self.type

  def compare(self, other):
    return self.__class__ == other.__class__ and self.getType() == other.getType()

  # matches banana card if
  # one is fresh and other is rotten
  def match(self, other):
    if other.__class__ == BananaCard(BananaCard.FRESH).__class__:
      return self.getType() != other.getType()

  def __str__(self):
    return "%s Banana" % (self.getType())
