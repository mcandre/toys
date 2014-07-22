BIN=rot13

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is ROT13

all: test

test: $(BIN)
	./$(BIN) < ROT13.hs

$(BIN): ROT13.hs
	ghc $(FLAGS) ROT13.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
