# Example POSIX sh scripts

# REQUIREMENTS

* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)

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
