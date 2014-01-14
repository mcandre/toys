all: test

test: fizzy
	./fizzy

fizzy: fizzy.rs
	rustc fizzy.rs

clean:
	-rm *.exe
	-rm -rf *.dSYM
	-rm fizzy
