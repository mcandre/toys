# Example (POSIX) ksh scripts

# REQUIREMENTS

* [ksh](http://www.kornshell.com)

## Optional

* [shfmt](https://github.com/mvdan/sh) (e.g. `go get github.com/mvdan/sh/cmd/shfmt`)
* [bashate](https://pypi.python.org/pypi/bashate/0.5.1)
* [shlint](https://rubygems.org/gems/shlint)
* [checkbashisms](https://sourceforge.net/projects/checkbaskisms/)
* [ShellCheck](https://hackage.haskell.org/package/ShellCheck)
* [stank](https://github.com/mcandre/stank) (e.g. `go get github.com/mcandre/stank/...`)

# DEVELOPMENT

## Lint

```
$ make lint
```

## Guard

Guard can monitor sh scripts for changes, automatically linting them.

```
$ guard
$ emacs .
```
