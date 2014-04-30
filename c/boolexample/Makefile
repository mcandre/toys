CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=boolexample

all: test

test: $(BIN)
	./$(BIN)

$(BIN): boolexample.c
	$(CC) $(FLAGS) -o $(BIN) boolexample.c

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.[ch]' -o -name '*.cpp' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
