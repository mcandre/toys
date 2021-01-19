module BookTest (
    testReflexivity
    ) where

import qualified Book

testReflexivity :: Book.Book -> Bool
testReflexivity b = b == b
