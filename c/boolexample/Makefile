all: test

test: boolexample
	./boolexample

boolexample: boolexample.c
	gcc -o boolexample -O2 -Wall boolexample.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm boolexample
