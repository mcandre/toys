# Example

```
$ make
mkdir -p bin/
rustc -o bin/hello hello.rs -O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result
bin/hello
Hello World!
```

# Requirements

* [Rust](http://www.rust-lang.org/) 0.12
