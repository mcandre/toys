-- | Fibber provides Fibonacci functionality.
module Fibber where

-- | fibber implements the Fibonacci function.
fibber :: Int -> Int
fibber 0 = 0
fibber 1 = 1
fibber n = fibber (n - 1) + fibber (n - 2)
