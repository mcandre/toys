#!/usr/bin/env runhaskell

-- Press Control+C to quit.
--
-- Andrew Pennebaker
-- 7 Feb 2011
--
-- Based on Per Magnus Therning's "Signals in Haskell"
-- http://therning.org/magnus/archives/285
--
-- Based on Rosetta Code
-- http://rosettacode.org/wiki/Handle_a_signal#Haskell

module SigintTest where

import Control.Exception (handle, AsyncException(UserInterrupt))
import Control.Monad (forever, when)
import System.Exit (exitFailure)

-- System (sleep) blocks UserInterrupt
import Control.Concurrent (threadDelay)

main :: IO ()
main = handle (\e -> when (e == UserInterrupt) exitFailure) $ forever $ do
  putStrLn "Repeating"
  threadDelay 10000000 {- µs -}
