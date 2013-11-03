all: test

test: hello
	./hello

hello: hello.cpp
	g++ -O2 -Wall -Wextra -o hello hello.cpp

lint:
	cppcheck *.cpp *.h

clean:
	-rm *.exe
	-rm hello
