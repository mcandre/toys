#!/usr/bin/env runhaskell

module Complain where

data Color
  = Green
  | Red
  | Blue
  | White
  | Black
  deriving (Eq, Ord, Show, Read)

complain :: Color -> String
complain c = case c of
  Green -> "Too green!"
  Red -> "Too red!"
  Blue -> "Not green enough!"
  White -> "Too light!"
  Black -> "Too dark!"

main = let
  green = Green :: Color
  red = Red :: Color
  blue = Black :: Color
  white = White :: Color
  black = Black :: Color
  in do
    putStrLn $ show green
    putStrLn $ show red
    putStrLn $ show blue

    putStrLn ""

    putStrLn $ complain green
    putStrLn $ complain red
    putStrLn $ complain blue
    putStrLn $ complain white
    putStrLn $ complain black
