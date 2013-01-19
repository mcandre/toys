#!/usr/bin/env runhaskell

import Control.Concurrent.ParallelIO.Global

main = parallel_ (map putChar "Hello World!") >> stopGlobalPool
