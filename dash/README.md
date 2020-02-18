# Example POSIX sh scripts

# Hello World

```console
$ ./lib/hello
Hello World!
```

# REQUIREMENTS

* [dash](https://linux.die.net/man/1/dash)

## Recommended

* [vast](http://github.com/mcandre/vast)
* [shfmt](https://github.com/mvdan/sh) (e.g. `go get github.com/mvdan/sh/cmd/shfmt`)
* [bashate](https://pypi.python.org/pypi/bashate/0.5.1)
* [shlint](https://rubygems.org/gems/shlint)
* [checkbashisms](https://sourceforge.net/projects/checkbaskisms/)
* [ShellCheck](https://hackage.haskell.org/package/ShellCheck)
* [stank](https://github.com/mcandre/stank) (e.g. `go get github.com/mcandre/stank/...`)

# DEVELOPMENT

## Build: Lint and Test

```console
$ vast
```

## Test

```console
$ vast itest
```

## Lint

```console
$ vast lint
```
