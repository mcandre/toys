# Introductory bash scripts

# EXAMPLE

```
$ bash lib/hello
Hello World!
```

# REQUIREMENTS

* [bash](https://www.gnu.org/software/bash/)

## Optional

* [shlint](https://github.com/duggan/shlint)
* [shellcheck](http://www.shellcheck.net/)

# DEVELOPMENT

## Lint

```
$ make lint
```

## Guard

Guard can monitor sh scripts for changes, automatically linting them.

```
$ guard
$ emacs .
```
