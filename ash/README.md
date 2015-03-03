# Introductory ash scripts

# EXAMPLE

```
$ lib/hello
Hello World!
```

# REQUIREMENTS

* `ash`

## Optional

* [shlint](https://github.com/duggan/shlint)
* [shellcheck](http://www.shellcheck.net/)
* [guard](http://guardgem.org/)

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
