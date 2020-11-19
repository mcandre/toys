# BUILDTIME REQUIREMENTS

* [Docker](https://www.docker.com/)

## Recommended

* [karp](https://github.com/mcandre/karp) (`go get github.com/mcandre/karp/...`)

# PREBUILD

```console
$ docker build -t mcandre/echo-buildbot .
$ docker run --rm -it -v "$(pwd):/src" mcandre/echo-buildbot sh
# cd /src
# cmake .
```

# LINT

```console
# cmake --build . --target lint
```

# COMPILE

```console
# cmake --build . --config Release
```

# LEAK CHECK

```console
# cmake --build . --target leaks
```

# TEST

```console
# CTEST_OUTPUT_ON_FAILURE=1 ctest -C Release
```

# DOCUMENT

```console
# cmake --build . --target doc
$ karp html/index.html
```

# CLEAN

```console
# ./clean-cmake.sh
```
