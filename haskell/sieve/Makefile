BIN=sieve

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Sieve

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Sieve.hs
	ghc $(FLAGS) Sieve.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
