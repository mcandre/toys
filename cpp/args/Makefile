CC=clang++
FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything

all: test

test: args
	./args

args: args.cpp
	$(CC) $(FLAGS) -o args args.cpp

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem .

cpplint:
	cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright *.cpp *.h

lint: cppcheck

clean:
	-rm *.exe
	-rm args
