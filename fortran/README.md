# mcandre/fortran

Introductory Fortran programs

# EXAMPLE

```
$ cd hello/
$ make
mkdir -p bin/
gfortran -O2 -Wall -o bin/hello hello.f08
bin/hello
 Hello World!
```

# REQUIREMENTS

* `gfortran` from `gcc`

E.g., `brew install gcc`
