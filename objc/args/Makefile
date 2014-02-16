FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o args

BIN=args

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Args.m
	clang $(FLAGS) Args.m

lint: $(BIN)
	oclint Args.m -- $(FLAGS)

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
