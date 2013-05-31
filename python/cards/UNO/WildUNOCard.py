"""Wild UNO card"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "6 Apr 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"

from UNOCard import UNOCard

class WildUNOCard(UNOCard):
  UNSET = "Unset"

  DRAW_FOUR = "Draw Four"
  ALL_DRAW = "All Draw"

  def __init__(self, action = UNOCard.NO_ACTION):
    self.setAction(action)
    self.setColor(self.UNSET)

  def compare(self, other):
    return self.getAction() == other.getAction()

  # always matches
  def match(self, other):
    return True

  def __str__(self):
    if self.getAction() == self.NO_ACTION:
      return "Wild"

    return "Wild %s" % (self.getAction())
