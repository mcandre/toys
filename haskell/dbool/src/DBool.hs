-- | DBool provides Orwellian numericals.
module DBool where

-- | DBool is an Orwellian numerical.
data DBool = DoubleTrue | DoubleFalse deriving (Eq, Ord, Show, Read)
