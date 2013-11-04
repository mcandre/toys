FLAGS=-Wall -Wextra -Wmost -framework Foundation -lobjc -o hello

all: test

test: hello
	./hello

hello: hello.m
	clang $(FLAGS) hello.m

lint: hello
	oclint hello.m -- $(FLAGS)

clean:
	-rm *.exe
	-rm hello
