# Introductory ash scripts

# EXAMPLE

```
$ lib/hello
Hello World!
```

# REQUIREMENTS

* [dash](http://www.in-ulm.de/~mascheck/various/ash/)

## Optional

* [shlint](https://github.com/duggan/shlint)
* [ShellCheck](http://www.shellcheck.net/)

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
