CC=g++
FLAGS=-O2 -Wall -Wextra -Weffc++
LINK_OPTIONS=
STD=

ifeq ("${MSYSTEM}","MINGW32")
	LINK_OPTIONS=-Wl,--enable-auto-import
else
	ASYNC=1 # MinGW x86 doesn't yet support threading
	STD=-std=c++11 -stdlib=libc++ # MinGW x86 doesn't yet support C++11
	AUTO=1

	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		CC=clang++
		FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything
	endif
endif

BIN=fizzy

all: test

test: $(BIN)
	./$(BIN)

$(BIN): fizzy.cpp
	$(CC) $(FLAGS) $(STD) $(LINK_OPTIONS) -o $(BIN) fizzy.cpp

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
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
