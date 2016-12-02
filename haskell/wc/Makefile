BIN=bin/wc

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is WC

all: test

test: $(BIN) quux.txt
	$(BIN) < quux.txt

$(BIN): WC.hs
	mkdir -p bin
	ghc $(FLAGS) WC.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin
	-rm *.o
	-rm *.hi
