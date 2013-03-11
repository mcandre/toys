#!/usr/bin/env runhaskell

-- Enum is surprisingly dumb.
{-# LANGUAGE StandaloneDeriving, TypeSynonymInstances, FlexibleInstances #-}

data Rank
     = Ace
     | Two
     | Three
     | Four
     | Five
     | Six
     | Seven
     | Eight
     | Nine
     | Ten
     | Jack
     | Queen
     | King
     deriving (Eq, Ord, Enum, Show, Read)

data Suit
     = Spades
     | Hearts
     | Diamonds
     | Clubs
     deriving (Eq, Ord, Enum, Show, Read)

data PokerCard = PokerCard {
  rank :: Rank,
  suit :: Suit
  } deriving (Eq, Ord, Enum)

instance Show PokerCard where
  show card = (show (rank card)) ++ " of " ++ (show (suit card))

o :: Rank -> Suit -> PokerCard
r `o` s = PokerCard { rank = r, suit = s }

deriving instance Enum PokerCard

pokerDeck = [Ace `o` Spades .. ]

main :: IO ()
main = putStrLn $ show pokerDeck
