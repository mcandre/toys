all: test

test: boolexample
	./boolexample

boolexample: boolexample.c
	gcc -O2 -Wall -Wextra -o boolexample boolexample.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm boolexample
