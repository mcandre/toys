BIN=bin/bird

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	$(BIN)

$(BIN): Bird.lhs
	mkdir -p bin/
	ghc $(FLAGS) Bird.lhs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
