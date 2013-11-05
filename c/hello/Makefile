CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: hello
	./hello

hello: hello.c
	$(CC) $(FLAGS) -o hello hello.c

lint:
	splint *.c *.h -preproc

clean:
	-rm *.exe
	-rm hello
