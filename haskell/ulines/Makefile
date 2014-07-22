BIN=ulines

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is ULines

all: test

test: $(BIN)
	./$(BIN)

$(BIN): ULines.hs
	ghc $(FLAGS) ULines.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
