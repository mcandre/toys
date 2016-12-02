# EXAMPLE

```
$ 99bottles
99 bottles of beer on the wall, 99 bottles of beer!
Take one down, pass it around,
98 bottles of beer on the wall!
98 bottles of beer on the wall, 98 bottles of beer!
Take one down, pass it around,
97 bottles of beer on the wall!
97 bottles of beer on the wall, 97 bottles of beer!
Take one down, pass it around,
...
```

# REQUIREMENTS

* [Go](https://golang.org) 1.7+ with [$GOPATH configured](https://gist.github.com/mcandre/ef73fb77a825bd153b7836ddbd9a6ddc)

## Optional

* [git](https://git-scm.com)
* [make](https://www.gnu.org/software/make/)
* [bash](https://www.gnu.org/software/bash/)
* [findutils](https://www.gnu.org/software/findutils/)
* [grep](https://www.gnu.org/software/grep/manual/grep.html)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)

# INSTALL FROM REMOTE GIT REPOSITORY

```
$ go get github.com/mcandre/mcandre/go/99bottles/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c "cd $GOPATH/src/github.com/mcandre/mcandre/go/99bottles && go install"
```

# LINT

Keep the code tidy:

```
$ make lint
```
