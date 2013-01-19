#!/usr/bin/env runhaskell

-- Andrew Pennebaker
--
-- Compile:
--
-- ghc -package parallel-io -threaded parhello.hs -o parhello
--
-- Run:
--
-- ./parhello +RTS

import Control.Concurrent.ParallelIO.Global
import System.IO

main = do
	-- By default, buffering prevents some IO nondeterminism
	hSetBuffering stdout NoBuffering

	parallel_ (map putChar "Hello World!")
	stopGlobalPool
