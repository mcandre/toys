{-# LANGUAGE DeriveGeneric #-}

-- | Mool provides useless data structures.
module Mool where

import GHC.Generics (Generic)
import Generic.Random as GR
import Test.QuickCheck as QC

-- | Mool is a useless data structure.
data Mool = Mool deriving (Eq, Ord, Show, Read, Generic)

instance QC.Arbitrary Mool where
    arbitrary = GR.genericArbitraryU
