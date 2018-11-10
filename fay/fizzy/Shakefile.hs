import Development.Shake
import Development.Shake.FilePath
import System.Directory as Dir

main :: IO ()
main = do
    homeDir <- Dir.getHomeDirectory

    shakeArgs shakeOptions{ shakeFiles="" } $ do
        want ["fizzy.js"]

        "fizzy.js" %> \out ->
            cmd_ "fay" "fizzy.hs"

        phony "hlint" $
            cmd_ "hlint" "."

        phony "lint" $
            need ["hlint"]

        phony "clean" $
            removeFilesAfter "" ["//*.js"]
