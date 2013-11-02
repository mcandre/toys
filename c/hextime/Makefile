all: test

test: hextime
	./hextime

hextime: hextime.c
	gcc -o hextime hextime.c

lint:
	splint *.c *.h

clean:
	rm *.exe
	rm hextime
