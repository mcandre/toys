module Fizzy where

import FFI
import Prelude

fizzy :: Int -> String
fizzy n = case (n `mod` 3, n `mod` 5) of
    (0, 0) -> "FizzBuzz"
    (0, _) -> "Fizz"
    (_, 0) -> "Buzz"
    _ -> show n

data Element
instance Show (Element)

getElementsByTagName :: String -> Fay [Element]
getElementsByTagName = ffi "document.getElementsByTagName(%1)"

getFirstElementByTagName :: String -> Fay Element
getFirstElementByTagName tag = do
    es <- getElementsByTagName tag
    return $ head es

putHTML :: Element -> String -> Fay ()
putHTML = ffi "%1.innerHTML += %2 + \"<br/>\""

mapM :: (a -> Fay ()) -> [a] -> Fay ()
mapM _ [] = return ()
mapM f (x:xs) = do
    f x
    mapM f xs

putElement :: String -> String -> Fay ()
putElement name message = do
    d <- getFirstElementByTagName name
    putHTML d message

main :: Fay ()
main = mapM (putElement "body" . fizzy) [1 .. 100]
