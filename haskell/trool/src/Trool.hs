-- | Trool provides trinary data structures, kek.
module Trool where

-- | Trool takes three forms.
data Trool
  = TriTrue
  | TriFalse
  | TriMeh
  deriving (Eq, Ord, Show, Read)
