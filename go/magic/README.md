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

# INSTALL

```
$ go get github.com/mcandre/mcandre/go/magic/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# COMPILE AND INSTALL LOCALLY

```
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c 'cd go/magic && go install'
