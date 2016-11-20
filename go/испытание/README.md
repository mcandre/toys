# испытание! ("ispitanye!")

испытание is a simple program, structured to test Go's support for Unicode. Go boasts solid support for Unicode strings, but this project proves that Go is compatible with Unicode in other parts of the project, such as executable names (yes) and type names (no).

# EXAMPLE

```
$ испытание
испытание!
```

# REQUIREMENTS

* [Go](https://golang.org) 1.7+ with [$GOPATH configured](https://gist.github.com/mcandre/ef73fb77a825bd153b7836ddbd9a6ddc)

## Optional

* [Git](https://git-scm.com)
* [Make](https://www.gnu.org/software/make/)
* [Bash](https://www.gnu.org/software/bash/)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)

# INSTALL FROM REMOTE GIT REPOSITORY

```
$ go get github.com/mcandre/mcandre/go/испытание/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c "cd $GOPATH/src/github.com/mcandre/mcandre/go/испытание && go install"
```

# TEST REMOTELY

```
$ go test github.com/mcandre/испытание/...
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
