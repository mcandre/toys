# toys/cpp

Introductory C++ programs

# EXAMPLE

```
$ cd hello/
$ make
mkdir -p bin/
clang++ -std=c++11 -stdlib=libc++ -O2 -Wall -Wextra -Weffc++ -Wmost -Weverything -Wno-c++98-compat -o bin/hello hello.cpp
bin/hello
Hello World!
```

# REQUIREMENTS

* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)
* a [C++ compiler](https://en.wikipedia.org/wiki/List_of_compilers#C.2B.2B_compilers)
* [make](https://www.gnu.org/software/make/)

## Optional

* [cppcheck](http://cppcheck.sourceforge.net)
* [splint](http://www.splint.org)
* [vera++](https://bitbucket.org/verateam/vera/wiki/Home)
* [valgrind](http://valgrind.org)
* [astyle](http://astyle.sourceforge.net)
