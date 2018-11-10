import Development.Shake
import Development.Shake.FilePath
import System.Directory as Dir

main :: IO ()
main = do
    homeDir <- Dir.getHomeDirectory

    shakeArgs shakeOptions{ shakeFiles="" } $ do
        want ["random.js"]

        "random.js" %> \out ->
            cmd_ "fay" "random.hs"

        phony "hlint" $
            cmd_ "hlint" "."

        phony "lint" $
            need ["hlint"]

        phony "clean" $
            removeFilesAfter "" ["//*.js"]
