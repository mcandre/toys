#!/usr/bin/env runhaskell

module Mool where

data Mool = Mool deriving (Eq, Ord, Show, Read)

main :: IO ()
main = print Mool
