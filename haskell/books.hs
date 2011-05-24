#!/usr/bin/env runhaskell

module Book where

data Book = Book Int String [String] deriving (Eq, Ord, Show, Read)