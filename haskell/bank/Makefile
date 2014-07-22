BIN=bank

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Bank

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Bank.hs
	ghc $(FLAGS) Bank.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
