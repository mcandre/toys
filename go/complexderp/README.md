# complexderp

Basic polar<->cartesian conversion as a Go exercise

# EXAMPLE

```
$ complexderp
zCartesian = (3.000000+4.000000i)
zPolar = Car2Pol128(zCartesian) = {5 0.9272952180016122}

Pol2Car128(Car2Pol128(zCartesian)) = (3.000000+4.000000i)
Car2Pol128(Pol2Car128(zPolar)) = {5 0.9272952180016121}``
```

# REQUIREMENTS

* [Go](https://golang.org) 1.7+ with [$GOPATH configured](https://gist.github.com/mcandre/ef73fb77a825bd153b7836ddbd9a6ddc)

## Optional

* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)
* [make](https://www.gnu.org/software/make/)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)
* [golint](https://github.com/golang/lint) (e.g. `go get github.com/golang/lint/golint`)

# INSTALL FROM REMOTE GIT REPOSITORY

```
$ go get github.com/mcandre/mcandre/go/complexderp/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c "cd $GOPATH/src/github.com/mcandre/mcandre/go/complexderp && go install"
```

# LINT

Keep the code tidy:

```
$ make lint
```
