# mcandre/rust/

Introductory Rust programs

# EXAMPLE

```
$ cd hello/
$ make
mkdir -p bin/
rustc -o bin/hello hello.rs -O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result
bin/hello
Hello World!
```

# REQUIREMENTS

* [rust](http://www.rust-lang.org/) 0.12

E.g., `brew install rust` (Mac OS X)

E.g., `chocolatey install rust` (Windows)

E.g., `sudo add-apt-repository ppa:hansjorg/rust && sudo apt-get update && sudo apt-get install rust-0.12` (Debuntu)
