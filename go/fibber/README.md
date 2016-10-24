# EXAMPLE

```
$ fibber 20
6765
```
# INSTALL

```
$ go get github.com/mcandre/mcandre/go/fibber/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# COMPILE AND INSTALL LOCALLY

```
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c 'cd go/fibber && go install'
