all: test

test: hextime
	./hextime

hextime: hextime.c
	gcc -o hextime hextime.c

lint:
	splint +warning-stream-stdout *.c *.h

clean:
	rm *.exe
	rm hextime
