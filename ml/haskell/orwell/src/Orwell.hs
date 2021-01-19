{-# LANGUAGE DeriveGeneric #-}

-- | Orwell provides Orwellian data types.
module Orwell where

import GHC.Generics (Generic)
import Generic.Random as GR
import Test.QuickCheck as QC

-- | Orwell uses only government approved nomenclature.
data Orwell
    = DoublePlusUnGood
    | DoubleUnGood
    | UnGood
    | Good
    | DoubleGood
    | DoublePlusGood
    deriving (Eq, Ord, Show, Read, Generic)

instance QC.Arbitrary Orwell where
    arbitrary = GR.genericArbitraryU
