BIN=echo

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	./$(BIN) < Echo.hs

$(BIN): Echo.hs
	ghc $(FLAGS) Echo.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
