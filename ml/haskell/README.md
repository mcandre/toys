# toys/ml/haskell

Introductory Haskell programs

# EXAMPLE

```console
$ cd hello
$ cabal update
$ cabal install --force-reinstalls --only-dependencies --enable-documentation
$ cabal install --force-reinstalls --only-dependencies --enable-tests
$ shake
$ dist/bin/hello
Hello World!
```

# RUNTIME REQUIREMENTS

(None)

# BUILDTIME REQUIREMENTS

* [GHC Haskell](http://www.haskell.org/) 8+
* [happy](https://hackage.haskell.org/package/happy) (e.g., `cabal install happy`)

# BUILD

```console
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
