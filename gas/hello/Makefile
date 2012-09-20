all: test

test: hello
	./hello

hello: hello.s
	gcc -o hello hello.s

clean:
	-rm hello
	-rm hello.exe
