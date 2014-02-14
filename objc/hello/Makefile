FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o hello

BIN=hello

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Hello.m
	clang $(FLAGS) Hello.m

lint: $(BIN)
	oclint Hello.m -- $(FLAGS)

clean:
	-rm *.exe
	-rm $(BIN)
