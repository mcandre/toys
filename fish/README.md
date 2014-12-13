# mcandre/fish

Introductory Fish programs

# EXAMPLE

```
$ fish lib/hello 
Hello World!
```

# REQUIREMENTS

* [fish](http://fishshell.com/)

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
