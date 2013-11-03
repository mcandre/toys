all: test

test: hello
	./hello

hello: hello.c
	gcc -O2 -Wall -o hello hello.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm hello
