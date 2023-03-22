# BUILDTIME REQUIREMENTS

* a C/C++ 17 compiler
* [cmake](https://cmake.org/) 3+
* [Python](https://www.python.org/) 3.11.2+ with `pip[3] install --upgrade pip setuptools` and `pip[3] install -r requirements-dev.txt`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10
* [direnv](https://direnv.net/) 2
* [GNU coreutils](https://www.gnu.org/software/coreutils/), [GNU findutils](https://www.gnu.org/software/findutils/), such as from [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
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
