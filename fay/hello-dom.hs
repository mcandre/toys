module HelloWorld where

import FFI
import Prelude

putStrLn :: String -> Fay ()
putStrLn = ffi "document.write(%1)"

main :: Fay ()
main = putStrLn "Hello World!"
