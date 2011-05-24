#!/usr/bin/env runhaskell

module DBool where

data DBool = DoubleTrue | DoubleFalse deriving (Eq, Ord, Show, Read)