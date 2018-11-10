-- | Cat provides kitty models.
module Cat where

-- | Cat encompasses all of feli-kind.
data Cat = Cat {
    name :: String,
    weight :: Double,
    owner :: String
} deriving (Eq, Ord, Show, Read)

-- | catapult is cruel.
catapult :: Maybe Cat -> String
catapult (Just c) = "Pull!\n" ++ name c ++ " says 'Meow!'"
catapult _ = "Nothing happened."
