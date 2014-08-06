BIN=bin/bank

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Bank

all: test

test: $(BIN)
	$(BIN)

$(BIN): Bank.hs
	mkdir -p bin/
	ghc $(FLAGS) Bank.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
