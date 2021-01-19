'''Gotcha Gator card'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '6 Apr 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'

from GoBananasCard import GoBananasCard
from MonkeyCard import MonkeyCard


class GotchaGatorCard(GoBananasCard):
    WILD = 'Wild'

    def __init__(self, number):
        self.setColor(GoBananasCard.GREEN)
        self.setNumber(number)

    def compare(self, other):
        return (
            self.__class__ == other.__class__ and
            self.getNumber() == other.getNumber()
        )

    # matches monkey card if
    # wild or
    # same numbers
    def match(self, other):
        if isinstance(other, MonkeyCard):
            if self.getNumber() == self.WILD:
                return True

            return self.getNumber() == other.getNumber()

        return False

    def __str__(self):
        return 'Gotcha Gator %s' % (self.getNumber())
