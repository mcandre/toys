BIN=bloomtest

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Bloomtest.hs
	ghc $(FLAGS) Bloomtest.hs -package bloomfilter

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
