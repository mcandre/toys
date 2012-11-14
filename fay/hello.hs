module Console where

import Language.Fay.FFI
import Language.Fay.Prelude

main = putStrLn "Hello World!"

-- | Print using console.log.
putStrLn :: String -> Fay ()
putStrLn = ffi "console.log(%1)"
