CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=wc

all: test

test: $(BIN)
	./$(BIN) < wc.c

$(BIN): wc.c
	$(CC) $(FLAGS) -o $(BIN) wc.c

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: cppcheck splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) < wc.c

clean:
	-rm *.exe
	-rm $(BIN)
