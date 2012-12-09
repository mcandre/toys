module Random where

import Language.Fay.FFI
import Language.Fay.Prelude

-- Monad returning a uniform random integer from [0,m)
random :: Integer -> Fay Int
random = ffi "Math.random() * %1"