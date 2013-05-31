#!/usr/bin/env python

"""Black Jack logic"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "1 Jan 2006 - 30 Jan 2007"
__copyright__ = "Copyright 2006 2007 Andrew Pennebaker"
__version__ = "0.2"

from Poker.PokerCard import PokerCard
from Poker.PokerDeck import PokerDeck

VALUE = {
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

def separate_aces(cards):
  """Split deck into a tuple of non-aces, aces"""

  normal = []
  aces = []

  for card in cards:
    if card.getRank() == PokerCard.ACE:
      aces.append(card)
    else:
      normal.append(card)

  return (normal, aces)

def total(cards):
  """Black Jack hand total"""

  normal_sum = 0
  cards = [e for e in cards] # copy

  normal, aces = separate_aces(cards)

  for card in normal:
    normal_sum += VALUE[card.getRank()]

  # if no aces or low aces make sum >= 21
  if len(aces) == 0:
    return normal_sum
    # try to use a high ace
  else:
    s = normal_sum + VALUE["High Ace"]
    for i in range(len(aces) - 1):
      s += VALUE["Low Ace"]

    # if high ace, low ace(s), and/or other cards make sum equal 21
    if s <= 21:
      return sum
      # better use low ace(s)
    else:
      s = normal_sum + VALUE["Low Ace"] * len(aces)
      return s

def main():
  """Play Black Jack"""

  deck = PokerDeck()
  deck.shuffle()

  dealer_hand = deck.deal(1)
  my_hand = deck.deal(1)
  dealer_hand.append(deck.deal(1)[0])
  my_hand.append(deck.deal(1)[0])

  dealer_total = total(dealer_hand)
  my_total = total(my_hand)

  while True:
    print "----------"
    print "Your hand:"
    print "\n".join(["%s" % (card) for card in my_hand])
    print "Total: %d" % (my_total)
    print "\nDealer shows:"
    print "\n".join(["%s" % (card) for card in dealer_hand[1:]])
    print "Dealer total: %d" % (total(dealer_hand[1:]))
    print "Hit or stay? "
    response = ""

    response = raw_input()

    if "h" in response.lower():
      my_hand.append(deck.deal(1)[0])
      my_total = total(my_hand)

      if my_total > 21:
        break
      else:
        break

  while dealer_total <= 16:
    dealer_hand.append(deck.deal(1)[0])
    dealer_total = total(dealer_hand)

  print "=======\nResult:\n======="

  print "Your hand:"
  print "\n".join(["%s" % (card) for card in my_hand])
  print "Total: %d" % (my_total)
  print "\nDealer hand:"
  print "\n".join(["%s" % (card) for card in dealer_hand])
  print "Dealer total: %d" % (total(dealer_hand))

  print "======="

  if my_total > 21:
    print "Busted!"
  elif dealer_total > 21:
    print "Dealer busted. You win!"
  elif dealer_total == 21:
    print "Dealer has 21. You lose."
  elif my_total == 21:
    print "You won 21!"
  elif dealer_total >= my_total:
    print "Dealer won."
  elif dealer_total < my_total:
    print "You win!"

if __name__ == "__main__":
  main()
