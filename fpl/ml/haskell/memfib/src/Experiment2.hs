module Main where

import Control.Monad (replicateM_)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = let y = fib 30 in replicateM_ 10 (print y)