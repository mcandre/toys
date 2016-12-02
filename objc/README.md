# mcandre/objc

Introductory Objective C programs

# EXAMPLE

```
$ cd hello/
$ make
mkdir -p bin/
clang -Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc  -o bin/hello Hello.m
bin/hello
2014-12-13 16:39:33.297 hello[48005:4755994] Hello World!
```

# REQUIREMENTS

* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)
* [clang](http://clang.llvm.org/)
* [make](https://www.gnu.org/software/make/)

## Optional

* [oclint](http://oclint.org)
* [valgrind](http://valgrind.org)
* [Infer](http://fbinfer.com)
* [astyle](http://astyle.sourceforge.net)
