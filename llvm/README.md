# mcandre/llvm

Introductory programming in LLVM

# EXAMPLE

```
$ make
llvm-as fizzy.ll
llc fizzy.bc
mkdir -p bin/
gcc -o bin/fizzy fizzy.s
bin/fizzy
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
...
98
Fizz
Buzz
```

# REQUIREMENTS

* [LLVM](http://llvm.org/)
