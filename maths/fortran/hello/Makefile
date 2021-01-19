FLAGS=-O2 -Wall

BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.f08
	mkdir -p bin/
	gfortran $(FLAGS) -o $(BIN) hello.f08

clean:
	-rm -rf bin/
