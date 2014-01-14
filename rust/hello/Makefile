all: test

test: hello
	./hello

hello: hello.rs
	rustc hello.rs

clean:
	-rm *.exe
	-rm -rf *.dSYM
	-rm hello
