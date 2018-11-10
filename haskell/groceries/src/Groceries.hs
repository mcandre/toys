-- Allows Flag to derive Typeable and Data
{-# LANGUAGE ScopedTypeVariables, DeriveDataTypeable #-}

module Main where

import Control.Monad (when)
import Data.Generics (Data, Typeable)
import System.Environment (getProgName, getArgs)
import System.Exit (exitSuccess)
import System.Console.GetOpt (
    OptDescr(Option),
    ArgDescr(OptArg, ReqArg, NoArg),
    usageInfo
    )

import qualified GetOptFu

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

options :: [GetOptFu.OptDescr Flag]
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
    pArgs <- GetOptFu.parseOpts program args options

    let debugMode = GetOptFu.getOption pArgs Debug == Just Debug

    when debugMode
        (do
                putStrLn $ "Raw Args: " ++ show args
                putStrLn $ "Parsed Args: " ++ show pArgs)

    when (GetOptFu.getOption pArgs Help == Just Help)
        (do
                putStrLn $ usageInfo program options
                exitSuccess)

    let theStore = case GetOptFu.getOption pArgs (Store "") of
                Just (Store x) -> x
                _ -> "FoodCo"

    let theCustomer = case GetOptFu.getOption pArgs (Customer "") of
                Just (Customer x) -> x
                _ -> "Mr. Derp"

    let thePeanutButter = case GetOptFu.getOption pArgs PeanutButter of
                Just PeanutButter -> 1
                _ -> 0

    let theJelly = case GetOptFu.getOption pArgs Jelly of
                Just Jelly -> 1
                _ -> 0

    let theBananas = case GetOptFu.getOption pArgs (Bananas Nothing) of
                Just (Bananas x) -> case x of
                    Just x' -> case GetOptFu.maybeRead x' :: Maybe Int of
                        Just y -> y
                        _ -> 0
                    _ -> 1
                _ -> 0

    let theExpressLane = case GetOptFu.getOption pArgs ExpressLane of
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
