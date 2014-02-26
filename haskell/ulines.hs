#!/usr/bin/env runhaskell

-- Universal line separator
--
-- Handles Windows CRLF \r\n
-- Handles Unix LF \n
-- Handles Mac OS CR \r

-- Based on splitLines from Real World Haskell
-- http://book.realworldhaskell.org/read/functional-programming.html#SplitLines.hs:splitLines.type

module ULines where

import Data.List (isInfixOf)
import Test.QuickCheck (quickCheck)

isLineTerminator :: Char -> Bool
isLineTerminator '\r' = True
isLineTerminator '\n' = True
isLineTerminator _ = False

ulines :: String -> [String]
ulines [] = []
ulines cs = prefix : case suffix of
    ('\r':'\n':rest) -> ulines rest
    ('\r':rest) -> ulines rest
    ('\n':rest) -> ulines rest
    _ -> []
  where (prefix, suffix) = break isLineTerminator cs

propOnlyNewlines :: String -> Bool
propOnlyNewlines s = not $ "\r" `isInfixOf` (unlines . ulines) s

main :: IO ()
main = quickCheck propOnlyNewlines
