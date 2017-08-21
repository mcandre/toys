# Example ksh93 scripts

# REQUIREMENTS

* [ksh93](http://www.kornshell.com/doc/ksh93.html), often packaged as "ksh".

For example, the Docker image [mcandre/docker-ksh93](https://hub.docker.com/r/mcandre/docker-ksh93/) offers ksh93.

## Optional

* [shfmt](https://github.com/mvdan/sh) (e.g. `go get github.com/mvdan/sh/cmd/shfmt)
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
