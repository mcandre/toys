/!\ Run at your own risk! /!\

The link command freezes my computer:

	$ make
	clang -c -o hello.o -arch i386 hello.s
	ld -o hello -macosx_version_min 10.6 hello.o
	(frozen)

Specs:

* ld64-134.9
* clang 4.1
* as 1.38
* Xcode 4.5
* Mac OS X 10.8.2
* MacBook Pro 2009