# BUILDTIME REQUIREMENTS

* [clang](https://clang.llvm.org/) 10+
* [cmake](https://cmake.org/) 3+
* [Python](https://www.python.org/) 3.11.2+ with `pip[3] install --upgrade pip setuptools` and `pip[3] install -r requirements-dev.txt`

## Recommended

* [GNU coreutils](https://www.gnu.org/software/coreutils/), [GNU findutils](https://www.gnu.org/software/findutils/), such as from [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
* [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
* [cppcheck](https://cppcheck.sourceforge.io/)
* [Doxygen](https://www.doxygen.nl/index.html)
* [rez](https://github.com/mcandre/rez) 0.0.11
* [sail](https://github.com/mcandre/sail) 0.0.1

# LINT

```console
$ rez lint
```

# BUILD

```console
$ rez build
```

# INSTALL

```console
$ rez [install]
```

# UNINSTALL

```console
$ rez uninstall
```

# LEAK CHECK

```console
$ rez leaks
```

# CLEAN

```console
$ rez clean
```
