module OrwellTest (
    testReflexivity
    ) where

import qualified Orwell

testReflexivity :: Orwell.Orwell -> Bool
testReflexivity o = o == o
