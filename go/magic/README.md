# EXAMPLE

```
$ magic
09 f9 11 02 9d 74 e3 5b d8 41 56 c5 63 56 88 bd
09 f9 11 02 9d 74 e3 5b d8 41 56 c5 63 56 88 be
09 f9 11 02 9d 74 e3 5b d8 41 56 c5 63 56 88 bf
                 [ redacted ]
                 09 f9 11 02 9d 74 e3 5b d8 41 56 c5 63 56 88 c1
                 09 f9 11 02 9d 74 e3 5b d8 41 56 c5 63 56 88 c2
```

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
$ go get github.com/mcandre/mcandre/go/magic/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c "cd $GOPATH/src/github.com/mcandre/mcandre/go/magic && go install"
```

# LINT

Keep the code tidy:

```
$ make lint
```
