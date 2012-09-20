all: test

test: hello
	./hello

hello: hello.s
	as -o hello.o hello.s
	gcc -o hello hello.o

clean:
	-rm hello
	-rm hello.o