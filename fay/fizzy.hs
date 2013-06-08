module Fizzy where

import Language.Fay.FFI
import Language.Fay.Prelude

fizzy :: Int -> String
fizzy n = case (n `mod` 3, n `mod` 5) of
  (0, 0) -> "FizzBuzz"
  (0, _) -> "Fizz"
  (_, 0) -> "Buzz"
  _ -> show n

consoleLog = String -> Fay ()
consoleLog s = ffi "console.log(%1)"

main :: Fay ()
main = mapM (consoleLog . fizzy) [1 .. 100]
