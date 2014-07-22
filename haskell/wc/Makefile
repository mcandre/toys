BIN=wc

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is WC

all: test

test: $(BIN)
	./$(BIN) < WC.hs

$(BIN): WC.hs
	ghc $(FLAGS) WC.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
