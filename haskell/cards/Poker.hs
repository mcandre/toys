data Suit
     = Spades
     | Hearts
     | Diamonds
     | Clubs
     deriving (Eq, Ord, Show, Read)

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
     deriving (Eq, Ord, Show, Read)

data PokerCard = PokerCard {
  suit :: Suit,
  rank :: Rank
  } deriving (Eq, Ord, Show, Read)
