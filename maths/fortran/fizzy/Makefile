FLAGS=-O2 -Wall

BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.f08
	mkdir -p bin/
	gfortran $(FLAGS) -o $(BIN) fizzy.f08

clean:
	-rm -rf bin/
