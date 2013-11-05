CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: boolexample
	./boolexample

boolexample: boolexample.c
	$(CC) $(FLAGS) -o boolexample boolexample.c

lint:
	splint *.c *.h -preproc

clean:
	-rm *.exe
	-rm boolexample
