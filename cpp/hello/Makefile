CC=clang++
FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything

all: test

test: hello
	./hello

hello: hello.cpp
	$(CC) $(FLAGS) -o hello hello.cpp

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem .

cpplint:
	cpplint --filter=-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright *.cpp *.h

lint: cppcheck

clean:
	-rm *.exe
	-rm hello
