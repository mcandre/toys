all: test

test: repl
	echo exit | ./repl

$(BIN): repl.c
	gcc -o repl -O2 -Wall repl.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm repl
