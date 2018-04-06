-- | Fizzy provides a FizzBuzz implementation.
module Fizzy where

import Control.Parallel.Strategies (parMap, rseq)

-- | fizzBuzz: a drinking game. Played by computer.
fizzBuzz :: [String]
fizzBuzz = parMap rseq fizzBuzz' [1 .. 100]
  where
    fizzBuzz' :: Int -> String
    fizzBuzz' x = case (x `mod` 3, x `mod` 5) of
      (0, 0) -> "FizzBuzz"
      (0, _) -> "Fizz"
      (_, 0) -> "Buzz"
      _ -> show x
