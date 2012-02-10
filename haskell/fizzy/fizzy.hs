#!/usr/bin/env runhaskell

-- FizzBuzz with parallel processing
-- Andrew Pennebaker

import Control.Parallel.Strategies
import Control.Parallel

fizzBuzz :: [String]
fizzBuzz = (parMap rseq) fizzBuzz' [1 .. 100]
	where
		fizzBuzz' :: Int -> String
		fizzBuzz' x
			| x `mod` 3 == 0 && x `mod` 5 == 0 = "FizzBuzz"
			| x `mod` 3 == 0 = "Fizz"
			| x `mod` 5 == 0 = "Buzz"
			| otherwise = show x

main :: IO ()
main = putStrLn $ unlines fizzBuzz