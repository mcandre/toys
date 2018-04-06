module Main where

import System.IO()

import qualified ROT13

main :: IO ()
main = interact ROT13.rot13
