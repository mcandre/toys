#!/usr/bin/env runhaskell

-- Andrew Pennebaker

fizzBuzz :: [String]
fizzBuzz = map fizzBuzz' [1 .. 100]
	where
		fizzBuzz' :: Int -> String
		fizzBuzz' x
			| x `mod` 3 == 0 && x `mod` 5 == 0 = "FizzBuzz"
			| x `mod` 3 == 0 = "Fizz"
			| x `mod` 5 == 0 = "Buzz"
			| otherwise = show x

main :: IO ()
main = putStrLn $ unlines fizzBuzz