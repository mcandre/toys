all: test

test: hextime
	./hextime

hextime: hextime.c
	gcc -O2 -Wall -o hextime hextime.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm hextime
