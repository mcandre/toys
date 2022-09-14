# pdksh: Example pdksh scripts

# Hello World

```console
$ ./lib/hello
Hello World!
```

# REQUIREMENTS

* [pdksh](https://directory.fsf.org/wiki/Pdksh)

## Recommended

* [vast](http://github.com/mcandre/vast)
* [shfmt](https://github.com/mvdan/sh) (e.g. `GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt`)
* [bashate](https://pypi.python.org/pypi/bashate/0.5.1)
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
