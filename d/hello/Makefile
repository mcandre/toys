FLAGS=-w -wi

all: test

test: hello
	./hello

hello: hello.d
	dmd $(FLAGS) hello

clean:
	-rm *.exe
	-rm hello
	-rm *.o
