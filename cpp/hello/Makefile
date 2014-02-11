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
	cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright *.cpp *.h

splint:
	find . -type f -name '*.c' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -exec vera++ -s {} \;
	find . -type f -name '*.c' -exec vera++ -s {} \;
	find . -type f -name '*.h' -exec vera++ -s {} \;

lint: cppcheck splint vera++

clean:
	-rm *.exe
	-rm hello
