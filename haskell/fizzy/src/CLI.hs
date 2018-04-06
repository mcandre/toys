module Main where

import qualified Fizzy

main :: IO ()
main = putStrLn . unlines $ Fizzy.fizzBuzz
