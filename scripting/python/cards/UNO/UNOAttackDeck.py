'''UNO Attack Deck'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '6 Apr 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'

from UNOAttackCard import UNOAttackCard
from NumberedUNOCard import NumberedUNOCard
from WildUNOCard import WildUNOCard
from WildUNOAttackCard import WildUNOAttackCard

from UNODeck import UNODeck


class UNOAttackDeck(UNODeck):
    def __init__(self, cards=None):
        if cards is None:
            cards = [
                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.SKIP),
                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.SKIP),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.SKIP),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.SKIP),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.SKIP),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.SKIP),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.SKIP),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.SKIP),

                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.HIT_TWO),
                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.HIT_TWO),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.HIT_TWO),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.HIT_TWO),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.HIT_TWO),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.HIT_TWO),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.HIT_TWO),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.HIT_TWO),

                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.REVERSE),
                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.REVERSE),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.REVERSE),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.REVERSE),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.REVERSE),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.REVERSE),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.REVERSE),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.REVERSE),

                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.DISCARD_ALL),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.DISCARD_ALL),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.DISCARD_ALL),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.DISCARD_ALL),

                UNOAttackCard(UNOAttackCard.RED, UNOAttackCard.TRADE_HANDS),
                UNOAttackCard(UNOAttackCard.GREEN, UNOAttackCard.TRADE_HANDS),
                UNOAttackCard(UNOAttackCard.BLUE, UNOAttackCard.TRADE_HANDS),
                UNOAttackCard(UNOAttackCard.YELLOW, UNOAttackCard.TRADE_HANDS),

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

                WildUNOAttackCard(),
                WildUNOAttackCard(),
                WildUNOAttackCard(),
                WildUNOAttackCard(),
                WildUNOCard(WildUNOCard.ALL_HIT),
                WildUNOCard(WildUNOCard.ALL_HIT),
                WildUNOCard(WildUNOCard.HIT_FIRE),
                WildUNOCard(WildUNOCard.HIT_FIRE)
            ]

        self.setCards(cards)
