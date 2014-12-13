# mcandre/objc

Introductory Objective C programs

# EXAMPLE

```
$ cd hello/
$ make
mkdir -p bin/
clang -Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc  -o bin/hello Hello.m
bin/hello
2014-12-13 16:39:33.297 hello[48005:4755994] Hello World!
```

# REQUIREMENTS

* [clang](http://clang.llvm.org/)

E.g., [Xcode](https://developer.apple.com/xcode/) (Mac OS X)

E.g., `sudo apt-get install clang` (Debuntu)

E.g., [Clang installer](http://llvm.org/releases/) (Windows)
