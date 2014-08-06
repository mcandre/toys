BIN=bin/poker

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	$(BIN)

$(BIN): Poker.hs
	mkdir -p bin/
	ghc $(FLAGS) Poker.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
