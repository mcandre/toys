BIN=bin/nat

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Nat

all: test

test: $(BIN)
	$(BIN)

$(BIN): Nat.hs
	mkdir -p bin/
	ghc $(FLAGS) Nat.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
