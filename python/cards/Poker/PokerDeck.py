"""Poker deck"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "1 Jan 2006 - 6 Apr 2006"
__copright__ = "Copyright 2006 Andrew Pennebaker"

from PokerCard import PokerCard
from Card.Deck import Deck


class PokerDeck(Deck):
    def __init__(self, cards=None):
        if cards is None:
            cards = [
                PokerCard(PokerCard.SPADE, PokerCard.ACE),
                PokerCard(PokerCard.SPADE, PokerCard.TWO),
                PokerCard(PokerCard.SPADE, PokerCard.THREE),
                PokerCard(PokerCard.SPADE, PokerCard.FOUR),
                PokerCard(PokerCard.SPADE, PokerCard.FIVE),
                PokerCard(PokerCard.SPADE, PokerCard.SIX),
                PokerCard(PokerCard.SPADE, PokerCard.SEVEN),
                PokerCard(PokerCard.SPADE, PokerCard.EIGHT),
                PokerCard(PokerCard.SPADE, PokerCard.NINE),
                PokerCard(PokerCard.SPADE, PokerCard.TEN),
                PokerCard(PokerCard.SPADE, PokerCard.JACK),
                PokerCard(PokerCard.SPADE, PokerCard.QUEEN),
                PokerCard(PokerCard.SPADE, PokerCard.KING),

                PokerCard(PokerCard.CLUB, PokerCard.ACE),
                PokerCard(PokerCard.CLUB, PokerCard.TWO),
                PokerCard(PokerCard.CLUB, PokerCard.THREE),
                PokerCard(PokerCard.CLUB, PokerCard.FOUR),
                PokerCard(PokerCard.CLUB, PokerCard.FIVE),
                PokerCard(PokerCard.CLUB, PokerCard.SIX),
                PokerCard(PokerCard.CLUB, PokerCard.SEVEN),
                PokerCard(PokerCard.CLUB, PokerCard.EIGHT),
                PokerCard(PokerCard.CLUB, PokerCard.NINE),
                PokerCard(PokerCard.CLUB, PokerCard.TEN),
                PokerCard(PokerCard.CLUB, PokerCard.JACK),
                PokerCard(PokerCard.CLUB, PokerCard.QUEEN),
                PokerCard(PokerCard.CLUB, PokerCard.KING),

                PokerCard(PokerCard.DIAMOND, PokerCard.ACE),
                PokerCard(PokerCard.DIAMOND, PokerCard.TWO),
                PokerCard(PokerCard.DIAMOND, PokerCard.THREE),
                PokerCard(PokerCard.DIAMOND, PokerCard.FOUR),
                PokerCard(PokerCard.DIAMOND, PokerCard.FIVE),
                PokerCard(PokerCard.DIAMOND, PokerCard.SIX),
                PokerCard(PokerCard.DIAMOND, PokerCard.SEVEN),
                PokerCard(PokerCard.DIAMOND, PokerCard.EIGHT),
                PokerCard(PokerCard.DIAMOND, PokerCard.NINE),
                PokerCard(PokerCard.DIAMOND, PokerCard.TEN),
                PokerCard(PokerCard.DIAMOND, PokerCard.JACK),
                PokerCard(PokerCard.DIAMOND, PokerCard.QUEEN),
                PokerCard(PokerCard.DIAMOND, PokerCard.KING),

                PokerCard(PokerCard.HEART, PokerCard.ACE),
                PokerCard(PokerCard.HEART, PokerCard.TWO),
                PokerCard(PokerCard.HEART, PokerCard.THREE),
                PokerCard(PokerCard.HEART, PokerCard.FOUR),
                PokerCard(PokerCard.HEART, PokerCard.FIVE),
                PokerCard(PokerCard.HEART, PokerCard.SIX),
                PokerCard(PokerCard.HEART, PokerCard.SEVEN),
                PokerCard(PokerCard.HEART, PokerCard.EIGHT),
                PokerCard(PokerCard.HEART, PokerCard.NINE),
                PokerCard(PokerCard.HEART, PokerCard.TEN),
                PokerCard(PokerCard.HEART, PokerCard.JACK),
                PokerCard(PokerCard.HEART, PokerCard.QUEEN),
                PokerCard(PokerCard.HEART, PokerCard.KING),
            ]

        self.setCards(cards)
