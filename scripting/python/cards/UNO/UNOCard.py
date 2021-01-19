'''UNO card'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '6 Apr 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'

from Card.Card import Card


class UNOCard(Card):
    RED = 'Red'
    GREEN = 'Green'
    BLUE = 'Blue'
    YELLOW = 'Yellow'

    SKIP = 'Skip'
    DRAW_TWO = 'Draw Two'
    REVERSE = 'Reverse'
    NO_ACTION = ''

    def __init__(self, color, action):
        self.setColor(color)
        self.setAction(action)

    def setColor(self, color):
        self.color = color

    def setAction(self, action):
        self.action = action

    def getColor(self):
        return self.color

    def getAction(self):
        return self.action

    def compare(self, other):
        return (
            self.getColor() == other.getColor() and
            self.getAction() == other.getAction()
        )

    # match if
    #     same colors or
    #     same actions
    def match(self, other):
        if self.getColor() == other.getColor():
            return True

        return self.getAction() == other.getAction()

    def __str__(self):
        return '%s %s' % (self.getColor(), self.getAction())
