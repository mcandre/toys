__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="6 Apr 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"

from Card.Card import Card

class GoBananasCard(Card):
	RED="Red"
	BLUE="Blue"
	GREEN="Green"

	ZERO="0"
	ONE="1"
	TWO="2"
	THREE="3"
	FOUR="4"

	def setColor(self, color):
		self.color=color
	def setNumber(self, number):
		self.number=number

	def getColor(self):
		return self.color
	def getNumber(self):
		return self.number
