module Main where

import Data.Monoid (mempty)

import Test.Framework.Runners.Console
import Test.Framework.Providers.QuickCheck2

import qualified ROT13Test

main :: IO ()
main = defaultMainWithOpts [
    testProperty "reversible" ROT13Test.propReversible
    ] mempty
