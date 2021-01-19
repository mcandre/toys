# ABOUT

Scientific experiment to evaluate how Haskell uses memoization to increase program efficiency.

[Source](https://groups.google.com/d/msg/haskell-cafe/4xOSfavJztU/ozKIGRDqe9UJ)

# Example

```console
$ shake install

$ time fib
832040
       12.11 real        1.92 user         0.21 sys
$ time fib2
832040
       2.56 real         1.94 user         0.06 sys
```
# RUNTIME REQUIREMENTS

(None)

# BUILDTIME REQUIREMENTS

* [GHC Haskell](http://www.haskell.org/) 8+

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
