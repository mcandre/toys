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
* [GNU make](https://www.gnu.org/software/make/) 3+
* a POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html) implementation
* GNU compatible [findutils](https://www.gnu.org/software/findutils/)
