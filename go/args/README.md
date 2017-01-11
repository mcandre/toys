# EXAMPLE

```
$ args a b c
i: 0 v: args
i: 1 v: a
i: 2 v: b
i: 3 v: c
```

# DOCUMENTATION

https://godoc.org/github.com/mcandre/toys/go/args

# REQUIREMENTS

* [Go](https://golang.org) 1.7+ with [$GOPATH configured](https://gist.github.com/mcandre/ef73fb77a825bd153b7836ddbd9a6ddc)

## Optional

* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)
* [make](https://www.gnu.org/software/make/)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)
* [golint](https://github.com/golang/lint) (e.g. `go get github.com/golang/lint/golint`)
* [errcheck](https://github.com/kisielk/errcheck) (e.g. `go get github.com/kisielk/errcheck`)

# INSTALL FROM REMOTE GIT REPOSITORY

```
$ go get github.com/mcandre/toys/go/args/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone git@github.com:mcandre/toys.git $GOPATH/src/github.com/mcandre/toys
$ sh -c "cd $GOPATH/src/github.com/mcandre/toys/go/args && go install"
```

# LINT

Keep the code tidy:

```
$ make lint
```
