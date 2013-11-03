all: test

test: hello
	./hello

hello: hello.m
	clang -Wall -Wextra -Wmost -framework Foundation -lobjc -o hello hello.m

clean:
	-rm *.exe
	-rm hello
