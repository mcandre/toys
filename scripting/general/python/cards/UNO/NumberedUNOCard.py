'''Numbered UNO card'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '6 Apr 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'

from UNOCard import UNOCard


class NumberedUNOCard(UNOCard):
    ZERO = 'Zero'
    ONE = 'One'
    TWO = 'Two'
    THREE = 'Three'
    FOUR = 'Four'
    FIVE = 'Five'
    SIX = 'Six'
    SEVEN = 'Seven'
    EIGHT = 'Eight'
    NINE = 'Nine'

    def __init__(self, color, number):
        self.setColor(color)
        self.setNumber(number)
        self.setAction(self.NO_ACTION)

    def setNumber(self, number):
        self.number = number

    def getNumber(self):
        return self.number

    def compare(self, other):
        return (
            self.__class__ == other.__class__ and
            self.getColor() == other.getColor() and
            self.getNumber() == other.getNumber()
        )

    # matches if equal colors or
    # other is card with equal number
    def match(self, other):
        if self.getColor() == other.getColor():
            return True
        elif isinstance(other, NumberedUNOCard):
            return self.getNumber() == other.getNumber()

        return False

    def __str__(self):
        return '%s %s' % (self.getColor(), self.getNumber())
