CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=wc

all: test

test: $(BIN)
	./$(BIN) < wc.c

$(BIN): wc.c
	$(CC) $(FLAGS) -o $(BIN) wc.c

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.[ch]' -o -name '*.cpp' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) < wc.c

clean:
	-rm *.exe
	-rm $(BIN)
