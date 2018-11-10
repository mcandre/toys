module ROT13Test (
    propReversible
    ) where

import qualified ROT13

propReversible :: String -> Bool
propReversible = ROT13.propReversible
