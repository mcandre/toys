module Main where

import qualified Cat as C
import qualified Dog as D

blaspheme :: C.Cat -> D.Dog
blaspheme (C.Cat name weight owner) = D.Dog name weight owner

main :: IO ()
main = do
  let jerry = C.Cat "Jerry" 5 "Tom"
  let rover = D.Dog "Rover" 10 "Col. Husky"

  putStrLn $ D.name (blaspheme jerry)
  putStrLn $ D.name rover
