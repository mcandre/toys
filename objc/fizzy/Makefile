FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o fizzy

all: test

test: fizzy
	./fizzy

fizzy: Fizzy.m
	clang $(FLAGS) Fizzy.m

lint: $(BIN)
	oclint -rc=SHORT_VARIABLE_NAME=1 Fizzy.m -- $(FLAGS)

clean:
	-rm *.exe
	-rm fizzy
