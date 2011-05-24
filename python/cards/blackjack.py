#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="1 Jan 2006 - 30 Jan 2007"
__copyright__="Copyright 2006 2007 Andrew Pennebaker"
__version__="0.2"

from Poker.PokerCard import PokerCard
from Poker.PokerDeck import PokerDeck

import sys

value={
	"Low Ace":1,
	"High Ace":11,
	PokerCard.TWO:2,
	PokerCard.THREE:3,
	PokerCard.FOUR:4,
	PokerCard.FIVE:5,
	PokerCard.SIX:6,
	PokerCard.SEVEN:7,
	PokerCard.EIGHT:8,
	PokerCard.NINE:9,
	PokerCard.TEN:10,
	PokerCard.JACK:10,
	PokerCard.QUEEN:10,
	PokerCard.KING:10,
	PokerCard.ACE:11
}

def separateAces(cards):
	normal=[]
	aces=[]

	for card in cards:
		if card.getRank()==PokerCard.ACE:
			aces.append(card)
		else:
			normal.append(card)

	return (normal, aces)

def total(cards):
	normalSum=0
	cards=[e for e in cards] # copy

	normal, aces=separateAces(cards)

	for card in normal:
		normalSum+=value[card.getRank()]

	# if no aces or low aces make sum >= 21
	if len(aces)==0:
		return normalSum
	# try to use a high ace
	else:
		sum=normalSum+value["High Ace"]
		for i in range(len(aces)-1):
			sum+=value["Low Ace"]

		# if high ace, low ace(s), and/or other cards make sum equal 21
		if sum<=21:
			return sum
		# better use low ace(s)
		else:
			sum=normalSum+value["Low Ace"]*len(aces)
			return sum

def main():
	deck=PokerDeck()
	deck.shuffle()

	dealerHand=deck.deal(1)
	myHand=deck.deal(1)
	dealerHand.append(deck.deal(1)[0])
	myHand.append(deck.deal(1)[0])

	dealerTotal=total(dealerHand)
	myTotal=total(myHand)

	while True:
		print "----------"
		print "Your hand:"
		print "\n".join(["%s" % (card) for card in myHand])
		print "Total: %d" % (myTotal)
		print "\nDealer shows:"
		print "\n".join(["%s" % (card) for card in dealerHand[1:]])
		print "Dealer total: %d" % (total(dealerHand[1:]))
		print "Hit or stay? "
		response=""

		try:
			response=raw_input()
		except Exception, e:
			sys.exit()

		if "h" in response.lower():
			myHand.append(deck.deal(1)[0])
			myTotal=total(myHand)

			if myTotal>21:
				break
		else:
			break

	while dealerTotal<=16:
		dealerHand.append(deck.deal(1)[0])
		dealerTotal=total(dealerHand)

	print "=======\nResult:\n======="

	print "Your hand:"
	print "\n".join(["%s" % (card) for card in myHand])
	print "Total: %d" % (myTotal)
	print "\nDealer hand:"
	print "\n".join(["%s" % (card) for card in dealerHand])
	print "Dealer total: %d" % (total(dealerHand))

	print "======="

	if myTotal>21:
		print "Busted!"
	elif dealerTotal>21:
		print "Dealer busted. You win!"
	elif dealerTotal==21:
		print "Dealer has 21. You lose."
	elif myTotal==21:
		print "You won 21!"
	elif dealerTotal>=myTotal:
		print "Dealer won."
	elif dealerTotal<myTotal:
		print "You win!"

if __name__=="__main__":
	main()
