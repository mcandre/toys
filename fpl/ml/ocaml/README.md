# ocaml

Introductory OCaml programs

# EXAMPLE

```console
$ cd hello
$ make
mkdir -p bin
ocamlc -w +a -o bin/hello hello.ml
bin/hello
Hello World!
```

# REQUIREMENTS

* [OCaml](http://caml.inria.fr/)
* [make](https://pubs.opengroup.org/onlinepubs/009695299/utilities/make.html)
* a POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html) implementation
* GNU compatible [findutils](https://www.gnu.org/software/findutils/)
