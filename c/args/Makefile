CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.c
	mkdir -p bin/
	$(CC) $(FLAGS) -o $(BIN) args.c

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: cppcheck splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) a b c

clean:
	-rm -rf bin/
