#!/usr/bin/env runhaskell

module ROT13 where

import Char (ord, chr, isLower, isUpper)
import IO (interact)
import Test.QuickCheck

littleA = ord 'a'
littleZ = ord 'z'
bigA = ord 'A'
bigZ = ord 'Z'

rot13Char :: Char -> Char
rot13Char c
	| isLower c = (rot littleA) c
	| isUpper c = (rot bigA) c
	| otherwise = c
	where
		rot r = chr . (r +) . flip mod 26 . (13 +) . flip (-) r . ord

rot13 :: String -> String
rot13 = map rot13Char

propReversible :: String -> Bool
propReversible text = (rot13 . rot13) text == text

test :: IO ()
test = quickCheck propReversible

main :: IO ()
main = interact rot13