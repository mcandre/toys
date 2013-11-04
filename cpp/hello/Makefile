all: test

test: hello
	./hello

hello: hello.cpp
	g++ -O2 -Wall -Wextra -o hello hello.cpp

lint:
	cppcheck .

clean:
	-rm *.exe
	-rm hello
