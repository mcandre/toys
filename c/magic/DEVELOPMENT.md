# BUILDTIME REQUIREMENTS

* [Docker](https://www.docker.com/)

# PREBUILD

```console
$ docker build -t mcandre/magic-buildbot .
$ docker run --rm -it -v "$(pwd):/src" mcandre/magic-buildbot sh
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

# DOCUMENT

```console
$ cmake --build . --target doc
$ karp html/index.html
```

# CLEAN

```console
$ ./clean-cmake.sh
```
