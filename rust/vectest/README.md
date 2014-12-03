# Example

```
$ make
mkdir -p bin/
rustc -o bin/vectest vectest.rs -O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result
bin/vectest
Program: bin/vectest
```

# Requirements

* [Rust](http://www.rust-lang.org/) 0.12
