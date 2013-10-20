# Example LaTeX documents

# REQUIREMENTS

* `pdflatex`

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

## Build

    $ pdflatex fizzy.tex

## Clean

    $ ./tclean.sh

## Lint

    $ shellcheck *.sh
    $ lacheck *.tex

## Guard

Guard can monitor files for changes, automatically checking them.

    $ guard
    $ guard -G Guardfile-lint
    $ emacs .
