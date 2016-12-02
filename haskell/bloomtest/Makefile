BIN=bin/bloomtest

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	$(BIN)

$(BIN): Bloomtest.hs
	mkdir -p bin
	ghc $(FLAGS) Bloomtest.hs -package bloomfilter

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin
	-rm *.o
	-rm *.hi
