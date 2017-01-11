# испытание! ("ispitanye!") - test

испытание is a simple program, structured to test Go's support for Unicode. Go boasts solid support for Unicode strings, but this project tests (испытание!) that Go is compatible with Unicode in other aspects projects:

* strings ✓
* import paths ✓
* package names ✓
* source filenames ✓
* test filenames ✓
* function names ✓
* executable names ✓
* type names ✓

However, other development tools like git and WLS bash, may not feature varying degrees of Unicode support.

# EXAMPLE

```
$ испытание
Испытание!
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
$ go get github.com/mcandre/toys/go/испытание/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone git@github.com:mcandre/toys.git $GOPATH/src/github.com/mcandre/toys
$ sh -c "cd $GOPATH/src/github.com/mcandre/toys/go/испытание && go install ./..."
```

# TEST REMOTELY

```
$ go test github.com/mcandre/toys/go/испытание/...
```

# TEST LOCALLY

```
$ go test
```

# LINT

Keep the code tidy:

```
$ make lint
```
