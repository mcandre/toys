BIN=bin/sieve

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Sieve

all: test

test: $(BIN)
	$(BIN)

$(BIN): Sieve.hs
	mkdir -p bin/
	ghc $(FLAGS) Sieve.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
