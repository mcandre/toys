# BUILDTIME REQUIREMENTS

* a [C++](https://www.cplusplus.com/) compiler with full C++17 support (e.g. clang 9+, g++ 9+, MSVC 19+)
* [cmake](https://cmake.org/) 3+
* [Python](https://www.python.org/) 3.11.2+ with `pip[3] install --upgrade pip setuptools` and `pip[3] install -r requirements-dev.txt`

## Recommended

* [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
* [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
* [cppcheck](https://cppcheck.sourceforge.io/)
* [Doxygen](https://www.doxygen.nl/index.html)
* [rez](https://github.com/mcandre/rez) 0.0.11
* [sail](https://github.com/mcandre/sail) 0.0.1

# AUDIT

```console
$ rez audit
```

# LINT

```console
$ rez lint
```

# TEST

```console
$ rez [test]
```

# INSTALL

```console
$ rez install
```

# UNINSTALL

```console
$ rez uninstall
```

# LEAK CHECK

```console
$ rez leaks
```

# DOCUMENT

```console
$ rez doc
$ karp html/index.html
```

# CLEAN

```console
$ rez clean
```
