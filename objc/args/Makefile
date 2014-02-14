FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o args

BIN=args

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Args.m
	clang $(FLAGS) Args.m

lint: $(BIN)
	oclint Args.m -- $(FLAGS)

clean:
	-rm *.exe
	-rm $(BIN)
