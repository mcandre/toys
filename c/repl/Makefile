CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: repl
	echo exit | ./repl

repl: repl.c
	$(CC) $(FLAGS) -o repl repl.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm repl
