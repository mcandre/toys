(Examples currently broken due to fay incompatibilties with GHC 8.)

# RUNTIME REQUIREMENTS

(None)

# BUILDTIME REQUIREMENTS

* [GHC Haskell](http://www.haskell.org/) 8+
* [fay](https://hackage.haskell.org/package/fay) 0.24

## Recommended

* [shake](https://shakebuild.com/) (e.g., `cabal install shake`)
* [hlint](https://hackage.haskell.org/package/hlint) (e.g., `cabal install happy; cabal install hlint`)

# BUILD

```console
$ cabal install --only-dependencies --enable-documentation
$ cabal install --only-dependencies --enable-tests
$ shake
```

# LINT

```console
$ shake lint
```

# TEST

```console
$ shake test
```

# PUBLISH

```console
$ shake publish
```
