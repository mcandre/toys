#!/usr/bin/env runhaskell

fibber :: Int -> Int
fibber 0 = 0
fibber 1 = 1
fibber n = fibber (n - 1) + fibber (n - 2)

main :: IO ()
main = print $ fibber 20
