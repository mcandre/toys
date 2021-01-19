module DBoolTest (
    testReflexivity
    ) where

import qualified DBool

import Test.HUnit

testReflexivity :: DBool.DBool -> Bool
testReflexivity d = d == d
