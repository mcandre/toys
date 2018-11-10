module Main where

import Text.Printf (printf)
import Control.Parallel.Strategies (parMap, rseq)

magic :: String
magic = unlines . parMap rseq magicN $ [1 .. 7]
    where
        magicN :: Int -> String
        magicN n
            | n > 0 && n < 8 && n /= 4 = "09 f9 11 02 9d 74 e3 5b d8 41 56 c5 63 56 88 " ++ printf "%02x" (0xbc + n)
            | otherwise                = "                 [ redacted ]                  "

main :: IO ()
main = putStr magic
