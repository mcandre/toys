module Main where

import Data.Monoid (mempty)

import Test.Framework.Runners.Console
import Test.Framework.Providers.QuickCheck2

import qualified IOS7CryptTest

main :: IO ()
main = defaultMainWithOpts [
  testProperty "reversible" IOS7CryptTest.propReversible
  ] mempty
