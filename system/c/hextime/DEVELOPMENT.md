# BUILDTIME REQUIREMENTS

* a C/C++ 17 compiler
* [cmake](https://cmake.org/) 3+

## Recommended

* [GNU coreutils](https://www.gnu.org/software/coreutils/), [GNU findutils](https://www.gnu.org/software/findutils/), such as from [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
* [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
* [cppcheck](https://cppcheck.sourceforge.io/)
* [cpplint](https://pypi.org/project/cpplint/)
* [Doxygen](https://www.doxygen.nl/index.html)
* [rez](https://github.com/mcandre/rez) v0.0.9
* [sail](https://github.com/mcandre/sail)
* [vera++](https://bitbucket.org/verateam/vera/wiki/Home)

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
