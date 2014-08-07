CC=clang++
FLAGS=-std=c++11 -stdlib=libc++ -O2 -Wall -Wextra -Weffc++ -Wmost -Weverything
LINK_OPTIONS=

ifeq ("${MSYSTEM}","MINGW32")
	LINK_OPTIONS=-Wl,--enable-auto-import
endif

BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.cpp
	mkdir -p bin/
	$(CC) $(FLAGS) $(LINK_OPTIONS) -o $(BIN) fizzy.cpp

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

cpplint:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright {} \;

splint:
	find . -type f -name '*.c' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: cppcheck cpplint splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm -rf bin/
