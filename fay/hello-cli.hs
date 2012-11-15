module HelloWorld where

import Language.Fay.FFI
import Language.Fay.Prelude

putStrLn :: String -> Fay ()
putStrLn = ffi "console.log(%1)"

main :: Fay ()
main = putStrLn "Hello World!"
