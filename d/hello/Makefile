all: test

test: hello
	./hello

hello: hello.d
	dmd hello

clean:
	-rm *.exe
	-rm hello
	-rm *.o
