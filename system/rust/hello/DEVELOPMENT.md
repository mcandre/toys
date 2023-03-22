# OVERVIEW

hello's own compilation process is compatible with standard cargo. We wrap some common workflows with tinyrick tasks for convenience.

# BUILDTIME REQUIREMENTS

* [Rust](https://www.rust-lang.org/en-US/) 1.63+ with `cargo install tinyrick@v0.0.9`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after each Rust application binary installation)
* [direnv](https://direnv.net/) 2
* [cargo-audit](https://crates.io/crates/cargo-audit) 0.16
* [clippy](https://github.com/rust-lang-nursery/rust-clippy)

# INSTALL BINARIES FROM SOURCE

```console
$ tinyrick install
```

# UNINSTALL BINARIES

```console
$ tinyrick uninstall
```

# BUILD: Doc, Lint, Test, and Compile

```console
$ tinyrick [build]
```

# PUBLISH

```console
$ tinyrick publish
```

# CLEAN

```console
$ tinyrick clean
```
