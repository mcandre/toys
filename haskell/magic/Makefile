BIN=magic

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Magic

all: test

test: $(BIN)
	./$(BIN)

$(BIN): magic.hs
	ghc $(FLAGS) magic.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
