-- | GetOptFu provides a basic CLI parsing library.
module GetOptFu (
  module System.Console.GetOpt,
  module Data.Generics,
  parseOpts,
  getOption,
  maybeRead
  ) where

import System.Exit (exitSuccess, exitFailure)
import System.IO (hPutStrLn, stderr)
import System.Console.GetOpt (
  ArgOrder(RequireOrder),
  OptDescr(Option),
  ArgDescr(OptArg, ReqArg, NoArg),
  getOpt,
  usageInfo
  )
import Data.List (nub)
import Data.Generics (Data, Typeable, toConstr)

-- | parseOpts collects raw options.
parseOpts :: (Eq a, Data a) => String -> [String] -> [OptDescr a] -> IO ([a], [String])
parseOpts prog argv opts = case getOpt RequireOrder opts argv of
  (flags, spares, []) -> return (nub flags, spares)
  (_, _, errors) -> do
    hPutStrLn stderr $ usageInfo prog opts
    exitFailure

-- | getOption queries options.
getOption :: (Eq a, Data a) => ([a], [String]) -> a -> Maybe a
getOption ([], _) flag = Nothing
getOption (flag':moreFlags, _) flag
  | toConstr flag' == toConstr flag = Just flag'
  | otherwise = getOption (moreFlags, []) flag

-- | maybeRead attempts string parsing.
maybeRead :: Read a => String -> Maybe a
maybeRead s = case reads s of
  [(r, "")] -> Just r
  _ -> Nothing
