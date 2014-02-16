FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o fizzy

BIN=fizzy

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Fizzy.m
	clang $(FLAGS) Fizzy.m

lint: $(BIN)
	oclint -rc=SHORT_VARIABLE_NAME=1 Fizzy.m -- $(FLAGS)

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
