-- Allows Flag to derive Typeable and Data
{-# LANGUAGE ScopedTypeVariables, DeriveDataTypeable #-}

module Main where

import Control.Monad (when)
import Data.Generics (Data, Typeable)
import System.Environment (getProgName, getArgs)
import System.Exit (exitSuccess, exitFailure)
import System.Console.GetOpt (
  OptDescr(Option),
  ArgDescr(ReqArg, NoArg),
  usageInfo
  )
import Test.QuickCheck

import qualified GetOptFu

import qualified IOS7Crypt

data Flag
  = Encrypt String
  | Decrypt String
  | Test
  | Help
  deriving (Eq, Ord, Show, Read, Typeable, Data)

options :: [OptDescr Flag]
options = [
  Option "e" ["encrypt"] (ReqArg Encrypt "<password>") "Encrypt a password",
  Option "d" ["decrypt"] (ReqArg Decrypt "<hash>") "Decrypt a hash",
  Option "t" ["test"] (NoArg Test) "Unit test IOS7Crypt",
  Option "h" ["help"] (NoArg Help) "Display usage information"
  ]

main :: IO ()
main = do
  program <- getProgName
  args <- getArgs
  pArgs <- GetOptFu.parseOpts program args options

  let justTheArgs = fst pArgs

  when (null justTheArgs || GetOptFu.getOption pArgs Help == Just Help)
    (do
      putStrLn $ usageInfo program options
      exitSuccess)

  -- Only the first command is observed.
  case head justTheArgs of
    (Encrypt password) -> IOS7Crypt.encrypt password >>= putStrLn
    (Decrypt hash) -> case IOS7Crypt.decrypt hash of
      Just password -> putStrLn password
      _ -> putStrLn "Invalid hash."
    Test -> quickCheck IOS7Crypt.propReversible
    _ -> do
      putStrLn $ usageInfo program options
      exitFailure
