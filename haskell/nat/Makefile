BIN=nat

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Nat

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Nat.hs
	ghc $(FLAGS) Nat.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
