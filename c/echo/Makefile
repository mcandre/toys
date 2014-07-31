CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=echo

all: test

test: $(BIN) echo.c
	./$(BIN) < echo.c

$(BIN): echo.c
	$(CC) $(FLAGS) -o $(BIN) echo.c

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) < echo.c

clean:
	-rm *.exe
	-rm $(BIN)
