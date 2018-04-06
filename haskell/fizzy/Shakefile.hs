import Development.Shake
import Development.Shake.FilePath
import System.Directory as Dir

main :: IO ()
main = do
  let tarball = "dist/fizzy-0.0.1.tar.gz"
  homeDir <- Dir.getHomeDirectory

  shakeArgs shakeOptions{ shakeFiles="dist" } $ do
    want ["dist/bin/fizzy" <.> exe]

    "dist/bin/fizzy" <.> exe %> \out ->
      cmd_ "cabal" "install" "--bindir" "dist/bin"

    phony "hlint" $
      cmd_ "hlint" "."

    phony "lint" $
      need ["hlint"]

    phony "test" $ do
      need ["dist/bin/fizzy" <.> exe]
      cmd_ ("dist/bin/fizzy" <.> exe)

    phony "install" $
      cmd_ "cabal" "install"

    phony "uninstall" $ do
      cmd_ "ghc-pkg" "unregister" "--force" "fizzy"
      removeFilesAfter homeDir ["/.cabal/bin/fizzy" <.> exe]

    phony "build" $
      cmd_ "cabal" "build"

    phony "haddock" $
      cmd_ "cabal" "haddock"

    tarball %> \_ -> do
      need ["build", "haddock"]
      cmd_ "cabal" "sdist"

    phony "sdist" $
      need [tarball]

    phony "publish" $ do
      need ["sdist"]
      cmd_ "cabal" "upload" tarball

    phony "clean" $
      cmd_ "cabal" "clean"
