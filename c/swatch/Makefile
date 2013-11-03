all: test

test: swatch
	./swatch

swatch: swatch.c
	gcc -O2 -Wall -o swatch swatch.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm swatch
