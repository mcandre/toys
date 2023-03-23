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

* a [C++](https://www.cplusplus.com/) compiler with full C++17 support (e.g. clang 9+, g++ 9+, MSVC 19+)
* [cmake](https://cmake.org/) 3+

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10
* [direnv](https://direnv.net/) 2
