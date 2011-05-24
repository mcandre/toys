__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="6 Apr 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"

from GoBananasCard import GoBananasCard

class MonkeyCard(GoBananasCard):
	MILD="Mild"
	WILD="Wild"

	def __init__(self, type, number):
		self.setType(type)
		self.setNumber(number)

	def setType(self, type):
		self.type=type
		if type==self.WILD:
			self.setColor(self.RED)
		else:
			self.setColor(self.BLUE)

	def getType(self):
		return self.type

	def compare(self, other):
		return (
			self.__class__==other.__class__ and
			self.getType()==other.getType() and
			self.getNumber()==other.getNumber()
		)

	# matches monkey card if
	# 	same numbers and
	#	one is mild and other is wild
	#
	# matches gator card if
	#	gator wild or
	#	same numbers
	def match(self, other):
		if other.__class__==MonkeyCard(MonkeyCard.MILD, MonkeyCard.ONE).__class__:
			return self.getNumber()==other.getNumber() and self.getType()!=other.getType()
		elif other.__class__==GotchaGatorCard(GotchaGatorCard.ONE).__class__:
			if other.getNumber()==GotchaGatorCard.WILD:
				return True

			return self.getNumber()==other.getNumber()

		return False

	def __str__(self):
		return "%s Monkey %s" % (self.getType(), self.getNumber())
