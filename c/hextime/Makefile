all: test

test: hextime
	./hextime

hextime: hextime.c
	gcc -o hextime hextime.c

lint:
	splint *.c *.h 2>&1

clean:
	rm *.exe
	rm hextime
