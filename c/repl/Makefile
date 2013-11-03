all: test

test: repl
	echo exit | ./repl

repl: repl.c
	gcc -O2 -Wall -o repl repl.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm repl
