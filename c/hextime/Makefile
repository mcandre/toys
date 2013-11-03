all: test

test: hextime
	./hextime

hextime: hextime.c
	gcc -o hextime -O2 hextime.c -Wall

lint:
	splint *.c *.h

clean:
	rm *.exe
	rm hextime
