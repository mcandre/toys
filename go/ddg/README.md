# DuckDuckGo Bang launcher

# EXAMPLE

```
$ ddg g dogs
...
https://duckduckgo.com/?q=!g%20dogs
https://encrypted.google.com/search?hl=en&q=dogs
```

# DOCUMENTATION

https://godoc.org/github.com/mcandre/toys/go/ddg

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
$ go get github.com/mcandre/toys/go/ddg/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone https://github.com/mcandre/toys.git $GOPATH/src/github.com/mcandre/toys
$ cd $GOPATh/src/github.com/mcandre/toys/go/ddg
$ git submodule update --init --recursive
$ go install
```

# LINT

Keep the code tidy:

```
$ make lint
```
