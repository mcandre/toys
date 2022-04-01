# OVERVIEW

fib's own compilation process is compatible with standard cargo. We wrap some common workflows with tinyrick tasks for convenience.

# BUILDTIME REQUIREMENTS

* [Rust](https://www.rust-lang.org/en-US/) 1.59+

## Recommended

* [cargo-audit](https://crates.io/crates/cargo-audit) 0.16
* [clippy](https://github.com/rust-lang-nursery/rust-clippy)
* [tinyrick](https://github.com/mcandre/tinyrick) (e.g., `cargo install tinyrick`)

# INSTALL BINARIES FROM SOURCE

```console
$ tinyrick install
```

# UNINSTALL BINARIES

```console
$ tinyrick uninstall
```

# SECURITY AUDIT

```console
$ tinyrick audit
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
