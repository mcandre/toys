# EXAMPLE

```
$ args a b c
i: 0 v: args
i: 1 v: a
i: 2 v: b
i: 3 v: c
```
# INSTALL

```
$ go get github.com/mcandre/mcandre/go/args/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# COMPILE AND INSTALL LOCALLY

```
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c 'cd go/args && go install'
```
