module Main where

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
  } deriving (Eq, Ord)

instance Show PokerCard where
  show card = show (rank card) ++ " of " ++ show (suit card)

o :: Rank -> Suit -> PokerCard
r `o` s = PokerCard { rank = r, suit = s }

pokerDeck :: [PokerCard]
pokerDeck = [ r `o` s | r <- [ Ace .. ], s <- [ Spades .. ] ]

main :: IO ()
main = mapM_ print pokerDeck
