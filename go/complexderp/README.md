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
# INSTALL

```
$ go get github.com/mcandre/mcandre/go/complexderp/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# COMPILE AND INSTALL LOCALLY

```
$ git clone git@github.com:mcandre/mcandre.git $GOPATH/src/github.com/mcandre/mcandre
$ sh -c 'cd go/complexderp && go install'
