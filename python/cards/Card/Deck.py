__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="1 Jan 2006 - 6 Apr 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"

from Card import Card

import os

class Deck:
	def __init__(self, cards=None):
		self.setCards(cards)

	def setCards(self, cards):
		self.cards=cards

	def getCards(self):
		return self.cards

	def setCard(self, index, card):
		self.cards[index]=card

	def getCard(self, index):
		return self.cards[index]

	def __len__(self):
		return len(self.cards)

	def add(self, card):
		self.cards.append(card)

	def remove(self, item=None):
		if item==None:
			return self.cards.pop()
		elif item.__class__==(1).__class__:
			return self.cards.pop(item)
		elif item.__class__==Card().__class__:
			loc=0
			while loc<len(self.cards):
				if self.cards[loc]==item:
					break
				loc+=1
			else:
				return None

			return self.cards.pop(loc)

	def contains(self, card):
		loc=0
		while loc<len(self.cards):
			if self.cards[loc]==item:
				return True
			loc+=1
		else:
			return False

	def shuffle(self, rounds=7): # NSA says 7 is enough to randomize a deck of cards
		"""TIMTOWDI"""

		for i in range(len(self.cards)):
			index=ord(os.urandom(1))%len(self.cards) # 0 to 255

			# rifle shuffle
			card=self.remove(index)
			self.add(card)

		if rounds>0:
			self.shuffle(rounds-1)

	def deal(self, number):
		cards=[]

		for i in range(number):
			cards.append(self.remove(0)) # draw from top

		return cards
