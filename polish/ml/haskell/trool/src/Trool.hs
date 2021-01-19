{-# LANGUAGE DeriveGeneric #-}

-- | Trool provides trinary data structures, kek.
module Trool where

import GHC.Generics (Generic)
import Generic.Random as GR
import Test.QuickCheck as QC

-- | Trool takes three forms.
data Trool
    = TriTrue
    | TriFalse
    | TriMeh
    deriving (Eq, Ord, Show, Read, Generic)

instance QC.Arbitrary Trool where
    arbitrary = GR.genericArbitraryU
