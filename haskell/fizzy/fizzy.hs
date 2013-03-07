#!/usr/bin/env runhaskell

-- FizzBuzz with parallel processing
-- Andrew Pennebaker

import Control.Parallel.Strategies
import Control.Parallel

fizzBuzz :: [String]
fizzBuzz = (parMap rseq) fizzBuzz' [1 .. 100]
  where
    fizzBuzz' :: Int -> String
    fizzBuzz' x = case (x `mod` 3, x `mod` 5) of
      (0, 0) -> "FizzBuzz"
      (0, _) -> "Fizz"
      (_, 0) -> "Buzz"
      _ -> show x

main :: IO ()
main = putStrLn . unlines $ fizzBuzz
