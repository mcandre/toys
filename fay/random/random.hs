module Random where

import FFI
import Prelude

data Element
instance Show (Element)

-- Monad returning a uniform random integer from [0,m)
random :: Int -> Fay Int
random = ffi "Math.floor(Math.random() * %1)"

addEventListener :: Element -> String -> Fay () -> Bool -> Fay ()
addEventListener = ffi "%1.addEventListener(%2, %3, %4)"

getElementsByTagName :: String -> Fay [Element]
getElementsByTagName = ffi "document.getElementsByTagName(%1)"

getFirstElementByTagName :: String -> Fay Element
getFirstElementByTagName tag = do
    es <- getElementsByTagName tag
    return $ head es

setHTML :: Element -> String -> Fay ()
setHTML = ffi "%1.innerHTML = %2"

refresh :: Fay ()
refresh = do
    d <- getFirstElementByTagName "div"
    r <- random 100
    setHTML d $ show r

main :: Fay ()
main = refresh
