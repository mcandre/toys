all: test

test: hello
	./hello

hello: hello.c
	gcc -o hello -O2 hello.c -Wall

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm hello
