all: test

test: hello
	./hello

hello: hello.oz
	ozc -x hello.oz

clean:
	-rm hello
	-rm *.exe
