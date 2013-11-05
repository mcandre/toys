all: test

test: hello
	./hello

hello: hello.cpp
	g++ -O2 -Wall -Wextra -Weffc++ -o hello hello.cpp

lint:
	cppcheck --enable=all --suppress=missingIncludeSystem .

clean:
	-rm *.exe
	-rm hello
