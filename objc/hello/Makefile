FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o hello

BIN=hello

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Hello.m
	clang $(FLAGS) Hello.m

lint: $(BIN)
	oclint Hello.m -- $(FLAGS)

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
