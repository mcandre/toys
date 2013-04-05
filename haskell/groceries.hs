#!/usr/bin/env runhaskell

-- Allows Flag to derive Typeable and Data
{-# LANGUAGE ScopedTypeVariables, DeriveDataTypeable #-}

-- Andrew Pennebaker
-- andrew.penenbaker@gmail.com
-- 3 Dec 2010

module Groceries where

import Control.Monad (when)
import GetOptFu

data Flag
  = Store String
  | Customer String
  | PeanutButter
  | Jelly
  | Bananas (Maybe String)
  | ExpressLane
  | Help
  | Debug
  deriving (Eq, Ord, Show, Read, Typeable, Data)

options :: [OptDescr Flag]
options = [
  Option "s" ["store"] (ReqArg Store "<name>") "Specify a store name",
  Option "c" ["customer"] (ReqArg Customer "<name>") "Specify a customer name",
  Option "p" ["peanutbutter"] (NoArg PeanutButter) "Itemize peanut butter",
  Option "j" ["jelly"] (NoArg Jelly) "Itemize jelly",
  Option "b" ["bananas"] (OptArg Bananas "<quantity>") "Itemize one or more bananas",
  Option "e" ["expresslane"] (NoArg ExpressLane) "Use the express lane",
  Option "h" ["help"] (NoArg Help) "Show usage information",
  Option "d" ["debug"] (NoArg Debug) "Show raw and parsed arguments"
  ]

main :: IO ()
main = do
  program <- getProgName
  args <- getArgs
  pArgs <- parseOpts program args options

  let debugMode = getOption pArgs Debug == Just Debug

  when debugMode
    (do
        putStrLn $ "Raw Args: " ++ show args
        putStrLn $ "Parsed Args: " ++ show pArgs)

  when (getOption pArgs Help == Just Help)
    (do
        putStrLn $ usageInfo program options
        exitSuccess)

  let theStore = case getOption pArgs (Store "") of
        Just (Store x) -> x
        _ -> "FoodCo"

  let theCustomer = case getOption pArgs (Customer "") of
        Just (Customer x) -> x
        _ -> "Mr. Derp"

  let thePeanutButter = case getOption pArgs PeanutButter of
        Just PeanutButter -> 1
        _ -> 0

  let theJelly = case getOption pArgs Jelly of
        Just Jelly -> 1
        _ -> 0

  let theBananas = case getOption pArgs (Bananas Nothing) of
        Just (Bananas x) -> case x of
          Just x -> case maybeRead x :: Maybe Int of
            Just y -> y
            _ -> 0
          _ -> 1
        _ -> 0

  let theExpressLane = case getOption pArgs ExpressLane of
        Just ExpressLane -> True
        _ -> False

  let numItems = thePeanutButter + theJelly + theBananas

  putStrLn $ theStore ++ " welcomes you, " ++ theCustomer ++ "."

  when (thePeanutButter > 0) (putStrLn "YOU BOUGHT PEANUT BUTTER!!!")
  when (theJelly > 0) (putStrLn "YOU BOUGHT JELLY!!!")
  when (theBananas > 0) (putStrLn $ "YOU BOUGHT " ++ show theBananas ++ " BANANAS!!!")

  putStrLn $ theCustomer ++ " bought " ++ show numItems ++ " items."

  putStrLn $ if theExpressLane
    then if numItems > 10
      then "Too many items for the express lane; items returned."
      else "Whoosh!"
    else "Thank you, come again soon."
