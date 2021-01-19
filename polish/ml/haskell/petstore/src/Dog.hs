-- | Dog provides doggy models.
module Dog where

-- | Dog encompasses everything it means to be a canine.
data Dog = Dog {
    name :: String,
    weight :: Double,
    owner :: String
} deriving (Eq, Ord, Show, Read)
