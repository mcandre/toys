# Example

```
$ make
mkdir -p bin/
rustc -o bin/fizzy fizzy.rs -O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result
bin/fizzy
1
2
Fizz
4
Buzz
...
```

# Requirements

* [Rust](http://www.rust-lang.org/) 0.12
