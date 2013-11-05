CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: swatch
	./swatch

swatch: swatch.c
	$(CC) $(FLAGS) -o swatch swatch.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm swatch
