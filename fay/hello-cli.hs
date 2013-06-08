module HelloWorld where

import FFI
import Prelude

putStrLn :: String -> Fay ()
putStrLn = ffi "console.log(%1)"

main :: Fay ()
main = putStrLn "Hello World!"
