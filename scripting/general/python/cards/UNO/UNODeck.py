'''UNO deck'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '6 Apr 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'

from UNOCard import UNOCard
from NumberedUNOCard import NumberedUNOCard
from WildUNOCard import WildUNOCard

from Card.Deck import Deck


class UNODeck(Deck):
    def __init__(self, cards=None):
        if cards is None:
            cards = [
                WildUNOCard(),
                WildUNOCard(),
                WildUNOCard(),
                WildUNOCard(),
                WildUNOCard(WildUNOCard.DRAW_FOUR),
                WildUNOCard(WildUNOCard.DRAW_FOUR),
                WildUNOCard(WildUNOCard.DRAW_FOUR),
                WildUNOCard(WildUNOCard.DRAW_FOUR),

                UNOCard(UNOCard.RED, UNOCard.SKIP),
                UNOCard(UNOCard.RED, UNOCard.SKIP),
                UNOCard(UNOCard.GREEN, UNOCard.SKIP),
                UNOCard(UNOCard.GREEN, UNOCard.SKIP),
                UNOCard(UNOCard.BLUE, UNOCard.SKIP),
                UNOCard(UNOCard.BLUE, UNOCard.SKIP),
                UNOCard(UNOCard.YELLOW, UNOCard.SKIP),
                UNOCard(UNOCard.YELLOW, UNOCard.SKIP),

                UNOCard(UNOCard.RED, UNOCard.DRAW_TWO),
                UNOCard(UNOCard.RED, UNOCard.DRAW_TWO),
                UNOCard(UNOCard.GREEN, UNOCard.DRAW_TWO),
                UNOCard(UNOCard.GREEN, UNOCard.DRAW_TWO),
                UNOCard(UNOCard.BLUE, UNOCard.DRAW_TWO),
                UNOCard(UNOCard.BLUE, UNOCard.DRAW_TWO),
                UNOCard(UNOCard.YELLOW, UNOCard.DRAW_TWO),
                UNOCard(UNOCard.YELLOW, UNOCard.DRAW_TWO),

                UNOCard(UNOCard.RED, UNOCard.REVERSE),
                UNOCard(UNOCard.RED, UNOCard.REVERSE),
                UNOCard(UNOCard.GREEN, UNOCard.REVERSE),
                UNOCard(UNOCard.GREEN, UNOCard.REVERSE),
                UNOCard(UNOCard.BLUE, UNOCard.REVERSE),
                UNOCard(UNOCard.BLUE, UNOCard.REVERSE),
                UNOCard(UNOCard.YELLOW, UNOCard.REVERSE),
                UNOCard(UNOCard.YELLOW, UNOCard.REVERSE),

                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.ZERO),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.NINE),
                NumberedUNOCard(NumberedUNOCard.RED, NumberedUNOCard.NINE),

                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.ZERO),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.NINE),
                NumberedUNOCard(NumberedUNOCard.GREEN, NumberedUNOCard.NINE),

                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.ZERO),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.NINE),
                NumberedUNOCard(NumberedUNOCard.BLUE, NumberedUNOCard.NINE),

                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.ZERO),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.ONE),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.TWO),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.THREE),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.FOUR),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.FIVE),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.SIX),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.SEVEN),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.EIGHT),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.NINE),
                NumberedUNOCard(NumberedUNOCard.YELLOW, NumberedUNOCard.NINE),
            ]

        self.setCards(cards)
