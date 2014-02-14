CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=echo

all: test

test: $(BIN) echo.c
	./$(BIN) < echo.c

$(BIN): echo.c
	$(CC) $(FLAGS) -o $(BIN) echo.c

splint:
	find . -type f -name '*.c' -exec splint {} \;
	find . -type f -name '*.h' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -exec vera++ -s {} \;
	find . -type f -name '*.c' -exec vera++ -s {} \;
	find . -type f -name '*.h' -exec vera++ -s {} \;

lint: splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) < echo.c

clean:
	-rm *.exe
	-rm $(BIN)
