CC=clang++
FLAGS=-std=c++11 -stdlib=libc++ -O2 -Wall -Wextra -Weffc++ -Wmost -Weverything -Wno-c++98-compat
LINK_OPTIONS=-lpthread

ifeq ("${MSYSTEM}","MINGW32")
	LINK_OPTIONS=$(LINK_OPTIONS) -Wl,--enable-auto-import
endif

BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.cpp
	mkdir -p bin/
	$(CC) $(FLAGS) $(LINK_OPTIONS) -o $(BIN) fizzy.cpp

cppcheck:
	cppcheck --quiet --enable=all --suppressions-list=$$HOME/suppressions.cfg .

cpplint:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec cpplint --filter=-readability/streams,-build/header_guard,-whitespace/parens,-readability/braces,-whitespace/newline,-legal/copyright {} \;

splint:
	find . -type f -name '*.c' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

astyle-apply:
	-find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[chm]" -exec astyle {} \; | grep -v Unchanged

astyle:
	-find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[chm]" -exec astyle --dry-run {} \; | grep -v Unchanged

clean-astyle:
	-find . -type f -name "*.orig" -exec rm {} \;

lint: cppcheck cpplint splint vera++ astyle

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean: clean-astyle
	-rm -rf bin/
