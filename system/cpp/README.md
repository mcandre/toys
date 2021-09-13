# cpp

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

* a C/C++ 17 compiler
* [cmake](https://cmake.org/) 3+

# Recommended

* [accio](https://github.com/mcandre/accio) 0.0.2
