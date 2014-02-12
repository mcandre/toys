#!/usr/bin/env runhaskell

module Main where

main = let
    x = 1
    y = 2
    z = 3
  in putStrLn $ "X = " ++ show x ++ "\nY = " ++ show y ++ "\nZ = " ++ show z
