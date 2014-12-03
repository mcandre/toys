# Example

```
$ make
mkdir -p bin/
rustc -o bin/args args.rs -O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result
bin/args a b c
bin/args
a
b
c
```

# Requirements

* [Rust](http://www.rust-lang.org/) 0.12
