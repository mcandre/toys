# Example sh scripts

# REQUIREMENTS

* `sh`

## Optional

* [guard](http://guardgem.org/)
* [shellcheck](http://www.shellcheck.net/)

Install `guard` (requires [Ruby](https://www.ruby-lang.org/)):

    $ bundle

Install `shellcheck` (requires [Haskell Platform](http://www.haskell.org/platform/)):

    $ cd ..
    $ git clone git@github.com:koalaman/shellcheck.git
    $ cabal install
    $ which shellcheck
    ~/.cabal/bin/shellcheck

# DEVELOPMENT

## Lint

    $ shellcheck *.sh

## Guard

Guard can monitor sh scripts for changes, automatically linting them.

    $ guard
    $ emacs .
