CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=args

all: test

test: $(BIN)
	./$(BIN) a b c

$(BIN): args.c
	$(CC) $(FLAGS) -o $(BIN) args.c

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.[ch]' -o -name '*.cpp' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) a b c

clean:
	-rm *.exe
	-rm $(BIN)
