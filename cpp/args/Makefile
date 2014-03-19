CC=clang++
FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything

BIN=args

all: test

test: $(BIN)
	./$(BIN) a b c

$(BIN): args.cpp
	$(CC) $(FLAGS) -o $(BIN) args.cpp

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem .

cpplint:
	find . -type f -name '*.[ch]' -o -name '*.cpp' -exec cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright {} \;

splint:
	find . -type f -name '*.c' -exec splint {} \;

vera++:
	find . -type f -name '*.[ch]' -o -name '*.cpp' -exec vera++ -s {} \;

lint: cppcheck cpplint splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) a b c

clean:
	-rm *.exe
	-rm $(BIN)
