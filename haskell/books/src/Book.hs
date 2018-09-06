{-# LANGUAGE DeriveGeneric #-}

-- | Book manages book records
module Book where

import GHC.Generics (Generic)
import Generic.Random as GR
import Test.QuickCheck as QC

-- | Book has an ID title, and list of authors
data Book = Book Int String [String] deriving (Eq, Ord, Show, Read, Generic)

instance QC.Arbitrary Book where
  arbitrary = GR.genericArbitraryU
