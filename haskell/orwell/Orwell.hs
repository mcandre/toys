#!/usr/bin/env runhaskell

module Orwell where

data Orwell
  = DoublePlusUnGood
  | DoubleUnGood
  | UnGood
  | Good
  | DoubleGood
  | DoublePlusGood
  deriving (Eq, Ord, Show, Read)
