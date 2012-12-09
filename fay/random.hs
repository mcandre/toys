module Random where

import Language.Fay.FFI
import Language.Fay.Prelude

data Element
instance Foreign Element
instance Show (Element)

-- Monad returning a uniform random integer from [0,m)
random :: Int -> Fay Int
random = ffi "Math.floor(Math.random() * %1)"

addEventListener :: Element -> String -> Fay () -> Bool -> Fay ()
addEventListener = ffi "%1.addEventListener(%1, %2, %3)"

getElementsByTagName :: String -> Fay [Element]
getElementsByTagName = ffi "document.getElementsByTagName(%1)"

getFirstElementByTagName :: String -> Fay Element
getFirstElementByTagName tag = ffi "document.getElementsByTagName(%1)[0]"

setText :: Element -> String -> Fay ()
setText = ffi "%1.text = %2"

refresh :: Fay ()
refresh = do
	d <- getFirstElementByTagName "div"
	r <- random 100
	setText d $ show r

main :: Fay ()
main = do
	body <- getFirstElementByTagName "body"
	addEventListener body "load" refresh False