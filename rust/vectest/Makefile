all: test

test: vectest
	./vectest

vectest: vectest.rs
	rustc vectest.rs

clean:
	-rm *.exe
	-rm -rf *.dSYM
	-rm vectest
