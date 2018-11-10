import Development.Shake
import Development.Shake.FilePath
import System.Directory as Dir

main :: IO ()
main = do
    homeDir <- Dir.getHomeDirectory

    shakeArgs shakeOptions{ shakeFiles="" } $ do
        want ["hello-dom.js"]

        "hello-dom.js" %> \out ->
            cmd_ "fay" "hello-dom.hs"

        phony "hlint" $
            cmd_ "hlint" "."

        phony "lint" $
            need ["hlint"]

        phony "clean" $
            removeFilesAfter "" ["//*.js"]
