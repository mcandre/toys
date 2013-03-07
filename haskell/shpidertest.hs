#!/usr/bin/env runhaskell

-- Andrew Pennebaker
-- andrew.pennebaker@gmail.com
-- 7 Feb 2011

module ShpiderTest where

import Network.Shpider hiding (get)
import Network.Shpider.Curl.Opts

main = do
  (result, page) <- runShpiderWithOptions [CurlUserAgent "Windows Mozilla"] $
    download "http://browser.yellosoft.us/text.php"

  case result of
    Ok -> putStrLn "Ok"
    _ -> putStrLn "Error"

  putStrLn $ source page
