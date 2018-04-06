module Main where

import Control.Monad (replicateM_)

fib :: Int -> Int
fib n = mem !! n

mem :: [Int]
mem = map aux [0..]
-- remark: even [Int] is not a very efficient data structure for this

aux :: Int -> Int
aux 0 = 0
aux 1 = 1
aux n = mem!!(n-1) + mem!!(n-2)

main :: IO ()
main = replicateM_ 10 $ (print . fib) 30
