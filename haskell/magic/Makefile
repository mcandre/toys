BIN=magic

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Magic

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Magic.hs
	ghc $(FLAGS) Magic.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
