CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: magic
	./magic

magic: magic.c
	$(CC) $(FLAGS) -o magic magic.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm magic
