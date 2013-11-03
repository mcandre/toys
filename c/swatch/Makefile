all: test

test: swatch
	./swatch

swatch: swatch.c
	gcc -o swatch -O2 -Wall swatch.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm swatch
