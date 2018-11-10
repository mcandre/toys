{-# LANGUAGE DeriveGeneric #-}

-- | DBool provides Orwellian numericals.
module DBool where

import GHC.Generics (Generic)
import Generic.Random as GR
import Test.QuickCheck as QC

-- | DBool is an Orwellian numerical.
data DBool = DoubleTrue | DoubleFalse deriving (Eq, Ord, Show, Read, Generic)

instance QC.Arbitrary DBool where
    arbitrary = GR.genericArbitraryU
