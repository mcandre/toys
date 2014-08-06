BIN=bin/echo

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	$(BIN) < Echo.hs

$(BIN): Echo.hs
	mkdir -p bin/
	ghc $(FLAGS) Echo.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
