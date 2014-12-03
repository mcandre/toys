# Example

```
$ make
mkdir -p bin/
rustc -o bin/fib fib.rs -O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result
bin/fib
Fib 40 = 102334155
```

# Requirements

* [Rust](http://www.rust-lang.org/) 0.12
