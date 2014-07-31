CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=swatch

all: test

test: $(BIN)
	./$(BIN)

$(BIN): swatch.c
	$(CC) $(FLAGS) -o $(BIN) swatch.c

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
