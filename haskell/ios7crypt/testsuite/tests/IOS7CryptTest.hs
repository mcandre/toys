module IOS7CryptTest (
  propReversible
  ) where

import qualified IOS7Crypt

propReversible :: Int -> String -> Bool
propReversible = IOS7Crypt.propReversible
