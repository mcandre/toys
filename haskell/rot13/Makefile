BIN=bin/rot13

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is ROT13

all: test

test: $(BIN)
	$(BIN) < ROT13.hs

$(BIN): ROT13.hs
	mkdir -p bin
	ghc $(FLAGS) ROT13.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin
	-rm *.o
	-rm *.hi
