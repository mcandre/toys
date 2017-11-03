# EXAMPLE

```
$ fizzy
1
2
Fizz
4
Buzz
...
```

# DOCUMENTATION

https://godoc.org/github.com/mcandre/toys/go/fizzy

# REQUIREMENTS

* [Go](https://golang.org) 1.7+ with [$GOPATH configured](https://gist.github.com/mcandre/ef73fb77a825bd153b7836ddbd9a6ddc)

## Optional

* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)
* [make](https://www.gnu.org/software/make/)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)
* [golint](https://github.com/golang/lint) (e.g. `go get github.com/golang/lint/golint`)
* [errcheck](https://github.com/kisielk/errcheck) (e.g. `go get github.com/kisielk/errcheck`)
* [nakedret](https://github.com/alexkohler/nakedret) (e.g. `go get github.com/alexkohler/nakedret`)

# INSTALL FROM REMOTE GIT REPOSITORY

```
$ go get github.com/mcandre/toys/go/fizzy/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone https://github.com.mcandre/toys.git $GOPATH/src/github.com/mcandre/toys
$ sh -c "cd $GOPATH/src/github.com/mcandre/toys/go/fizzy && go install"
```

# LINT

Keep the code tidy:

```
$ make lint
```
