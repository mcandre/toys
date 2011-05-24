__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="1 Jan 2006 - 6 Apr 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"

from Card.Card import Card

class PokerCard(Card):
	SPADE="Spade"
	CLUB="Club"
	DIAMOND="Diamond"
	HEART="Heart"

	ACE="Ace"
	TWO="2"
	THREE="3"
	FOUR="4"
	FIVE="5"
	SIX="6"
	SEVEN="7"
	EIGHT="8"
	NINE="9"
	TEN="10"
	JACK="Jack"
	QUEEN="Queen"
	KING="King"
	JOKER="Joker"

	def __init__(self, suit, rank):
		self.setSuit(suit)
		self.setRank(rank)

	def setSuit(self, suit):
		self.suit=suit

	def setRank(self, rank):
		self.rank=rank

	def getSuit(self):
		return self.suit

	def getRank(self):
		return self.rank

	def compare(self, other):
		return self.getSuit()==other.getSuit() and self.getRank()==other.getRank()

	def __str__(self):
		return "%s %s" % (self.getSuit(), self.getRank())
