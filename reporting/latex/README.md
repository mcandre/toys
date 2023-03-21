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

## Optional

* [lacheck](https://www.ctan.org/pkg/lacheck)
* [chktex](http://baruch.ev-en.org/proj/chktex/)
* [checkmake](https://github.com/mrtazz/checkmake)
* [GNU findutils](https://www.gnu.org/software/findutils/)
* [GNU make](https://www.gnu.org/software/make/)

# DEVELOPMENT

## Build

```
$ make fizzy.pdf
```

## Clean

```
$ make clean
```

## Lint

```
$ for f in *.tex; do lacheck $f; done
```

## Guard

Guard can monitor .tex files for changes, automatically recompiling them into PDFs.

```
$ guard
$ emacs .
```

Guard can also automatically lint .tex files.

```
$ guard -G Guardfile-lint
$ emacs .
```
