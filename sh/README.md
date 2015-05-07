# Example POSIX sh scripts

# REQUIREMENTS

* `sh`

On many Unix systems, `sh` resolves to `bash`. However, you can use [BusyBox](http://www.busybox.net/) or [Homebrew](http://brew.sh/) to access specifically the circa 1975 UNIX System 6 `sh` for testing backwards compatibility.

E.g., `brew install osh`

## Optional

* [shlint](https://github.com/duggan/shlint)
* [shellcheck](http://www.shellcheck.net/)
* [guard](http://guardgem.org/)

# DEVELOPMENT

## Lint

    $ make lint

## Guard

Guard can monitor sh scripts for changes, automatically linting them.

    $ guard
    $ emacs .
