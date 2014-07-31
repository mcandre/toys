CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=repl

all: test

test: $(BIN)
	echo exit | ./$(BIN)

$(BIN): repl.c
	$(CC) $(FLAGS) -o $(BIN) repl.c

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes echo exit | ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
