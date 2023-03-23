# D

Introductory D programs

# EXAMPLE

```
$ cd hello/
$ make
mkdir -p bin/
dmd -w -wi -ofbin/hello hello
bin/hello
Hello World!
```

# REQUIREMENTS

* [dmd](http://dlang.org/) 2+
* [GNU make](https://www.gnu.org/software/make/) 3+
* a POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html) implementation
* GNU compatible [findutils](https://www.gnu.org/software/findutils/)
