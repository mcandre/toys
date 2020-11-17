# BUILDTIME REQUIREMENTS

* a [C++](https://en.wikipedia.org/wiki/List_of_compilers#C_compilers) compiler

## Recommended

* [cmake](https://cmake.org/)
* [coreutils](https://www.gnu.org/software/coreutils/)
* [cppcheck](http://cppcheck.sourceforge.net/)
* [cpplint](https://github.com/cpplint/cpplint)
* [Docker](https://www.docker.com/)
* [findutils](https://www.gnu.org/software/findutils/)
* [sail](https://github.com/mcandre/sail)
* [Valgrind](https://valgrind.org/)
* [vera++](https://bitbucket.org/verateam/vera/wiki/Home)

# PREBUILD

```console
$ docker build -t mcandre/cpp-fizzy-buildbot .
$ docker run --rm -it -v "$(pwd):/src" mcandre/cpp-fizzy-buildbot sh
$ cd /src
$ cmake .
```

# LINT

```console
$ cmake --build . --target lint
```

# COMPILE

```console
$ cmake --build . --config Release
```

# LEAK CHECK

```console
$ cmake --build . --target leaks
```

# TEST

```console
$ CTEST_OUTPUT_ON_FAILURE=1 ctest -C Release
```

# CLEAN

```console
$ ./clean-cmake.sh
```
