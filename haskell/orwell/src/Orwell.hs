-- | Orwell provides Orwellian data types.
module Orwell where

-- | Orwell uses only government approved nomenclature.
data Orwell
  = DoublePlusUnGood
  | DoubleUnGood
  | UnGood
  | Good
  | DoubleGood
  | DoublePlusGood
  deriving (Eq, Ord, Show, Read)
