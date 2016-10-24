# DuckDuckGo Bang launcher

# EXAMPLE

```
$ ddg g dogs
...
https://duckduckgo.com/?q=!g%20dogs
https://encrypted.google.com/search?hl=en&q=dogs
```
# DEPENDENCIES

Set the environment variable `GOPATH` to some directory like `$HOME/go`, then:

```
$ git submodule update --init --recursive
```

# INSTALL

```
$ go get github.com/mcandre/mcandre/go/ddg/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# COMPILE AND INSTALL LOCALLY

```
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c 'cd go/ddg && go install'
