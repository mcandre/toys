#!/usr/bin/env runhaskell

module Trool where

data Trool
  = TriTrue
  | TriFalse
  | TriMeh
  deriving (Eq, Ord, Show, Read)
