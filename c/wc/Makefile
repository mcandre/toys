CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: wc
	./wc < wc.c

wc: wc.c
	$(CC) $(FLAGS) -o wc wc.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm wc
