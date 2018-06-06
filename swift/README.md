# toys/swift

Introductory Swift programs

# EXAMPLE

```
$ cd hello
$ make
mkdir -p bin
swiftc -o bin/Hello Hello.swift
bin/Hello
Hello World!
```

# BUILDTIME REQUIREMENTS

* [Swift](https://swift.org/) 4+
* [mint](https://github.com/yonaskolb/mint)
* [SwiftLint](https://github.com/realm/SwiftLint) (e.g., `mint install realm/SwiftLint`)
* [Infer](http://fbinfer.com/)
* [Python](https://www.python.org/) 2
* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)
* [make](https://www.gnu.org/software/make/)
