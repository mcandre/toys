module DBoolTest (
    testReflexivity
    ) where

import qualified Mool

import Test.HUnit

testReflexivity :: Mool.Mool -> Bool
testReflexivity m = m == m
