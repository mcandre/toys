"""Go Bananas deck"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "6 Apr 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"

from MonkeyCard import MonkeyCard
from GotchaGatorCard import GotchaGatorCard
from BananaCard import BananaCard

from Card.Deck import Deck

class GoBananasDeck(Deck):
  def __init__(self, cards = None):
    if cards != None:
      self.setCards(cards)
    else:
      self.setCards(
        [
          GotchaGatorCard(GotchaGatorCard.WILD),
          GotchaGatorCard(GotchaGatorCard.ONE),
          GotchaGatorCard(GotchaGatorCard.ONE),
          GotchaGatorCard(GotchaGatorCard.TWO),
          GotchaGatorCard(GotchaGatorCard.TWO),
          GotchaGatorCard(GotchaGatorCard.THREE),
          GotchaGatorCard(GotchaGatorCard.THREE),
          GotchaGatorCard(GotchaGatorCard.FOUR),
          GotchaGatorCard(GotchaGatorCard.FOUR),

          BananaCard(BananaCard.FRESH),
          BananaCard(BananaCard.FRESH),
          BananaCard(BananaCard.FRESH),
          BananaCard(BananaCard.ROTTEN),
          BananaCard(BananaCard.ROTTEN),
          BananaCard(BananaCard.ROTTEN),

          MonkeyCard(MonkeyCard.MILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.MILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.ONE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.TWO),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.THREE),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.FOUR),
          MonkeyCard(MonkeyCard.WILD, MonkeyCard.FOUR)
        ]
      )
