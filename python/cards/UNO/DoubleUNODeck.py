'''Double UNO deck'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '6 Apr 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'

from UNODeck import UNODeck


class DoubleUNODeck(UNODeck):
    def __init__(self, cards=None):
        # if deck is already a regular UNO Deck
        if len(cards) == len(UNODeck().getCards()):  # 108
            self.setCards(cards + UNODeck().getCards())
        else:
            self.setCards(UNODeck().getCards() + UNODeck().getCards())
