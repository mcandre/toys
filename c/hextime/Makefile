CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: hextime
	./hextime

hextime: hextime.c
	$(CC) $(FLAGS) -o hextime hextime.c

lint:
	splint *.c *.h -preproc

clean:
	-rm *.exe
	-rm hextime
