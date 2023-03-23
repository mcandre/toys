# LaTeX

Introductory LaTeX programs/documents

# EXAMPLE

```
$ make fizzy.pdf
pdflatex -interaction=nonstopmode fizzy
$ open fizzy.pdf
...
```

# REQUIREMENTS

* [pdflatex](https://linux.die.net/man/1/pdflatex)
* [lacheck](https://www.ctan.org/pkg/lacheck)
* [chktex](http://baruch.ev-en.org/proj/chktex/)
* [GNU make](https://www.gnu.org/software/make/) 3+
* a POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html) implementation
* GNU compatible [findutils](https://www.gnu.org/software/findutils/)

# DEVELOPMENT

## Build

```console
$ make fizzy.pdf
```

## Clean

```console
$ make clean
```

## Lint

```console
$ for f in *.tex; do lacheck $f; done
```
