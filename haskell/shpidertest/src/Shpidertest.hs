-- Unfortunately broken due to shpider dependency tree incompatibilities with GHC 8.

module Main where

import Network.Shpider hiding (get)
import Network.Shpider.Curl.Opts

main :: IO ()
main = do
  (result, page) <- runShpiderWithOptions [CurlUserAgent "Windows Mozilla"] $
    download "http://google.com/index.html"

  case result of
    Ok -> putStrLn "Ok"
    _ -> putStrLn "Error"

  putStrLn $ source page
