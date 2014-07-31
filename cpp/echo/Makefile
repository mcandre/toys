CC=clang++
FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything

BIN=echo

all: test

test: $(BIN)
	./$(BIN) < echo.cpp

$(BIN): echo.cpp
	$(CC) $(FLAGS) -o $(BIN) echo.cpp

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

cpplint:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright {} \;

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: cppcheck cpplint splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) < echo.cpp

clean:
	-rm *.exe
	-rm $(BIN)
