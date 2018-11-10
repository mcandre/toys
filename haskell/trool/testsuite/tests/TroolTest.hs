module TroolTest (
    testReflexivity
    ) where

import qualified Trool

testReflexivity :: Trool.Trool -> Bool
testReflexivity t = t == t
