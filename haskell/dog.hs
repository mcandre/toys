#!/usr/bin/env runhaskell

module Dog where

data Dog = Dog {
  name :: String,
  weight :: Double,
  owner :: String
} deriving (Eq, Ord, Show, Read)
