-- From http://en.wikipedia.org/wiki/Concurrent_Haskell

module Main where

import Control.Concurrent.STM (
    TVar,
    STM,
    newTVarIO,
    readTVar,
    writeTVar,
    atomically,
    retry
    )

type Account = TVar Integer

newAccount :: Integer -> IO Account
newAccount = newTVarIO

credit :: Integer -> Account -> STM ()
credit amount account = do
    current <- readTVar account
    writeTVar account (current + amount)

debit :: Integer -> Account -> STM ()
debit amount account = do
    current <- readTVar account
    writeTVar account (current - amount)

transfer :: Integer -> Account -> Account -> STM ()
transfer amount from to = do
    fromVal <- readTVar from
    if (fromVal - amount) >= 0
        then do
            debit amount from
            credit amount to
        else retry

main :: IO ()
main = do
    bob <- newAccount 10000
    alice <- newAccount 4000

    beginBob <- readTVarIO bob
    beginAlice <- readTVarIO alice

    putStrLn $ "Bob began with " ++ show beginBob ++ " in his account."
    putStrLn $ "Alice began with " ++ show beginAlice ++ " in her account."

    let check = 2000

    putStrLn $ "Transferring " ++ show check ++ " from Bob to Alice."

    atomically $ transfer check bob alice

    endBob <- readTVarIO bob
    endAlice <- readTVarIO alice

    putStrLn $ "Bob ended with " ++ show endBob ++ " in his account." -- should be 8000
    putStrLn $ "Alice ended with " ++ show endAlice ++ " in her account." -- should be 6000
