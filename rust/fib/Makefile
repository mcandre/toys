all: test

test: fib
	./fib

fib: fib.rs
	rustc fib.rs

clean:
	-rm *.exe
	-rm fib
