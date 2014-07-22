BIN=cat

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Cat

all: test

test: $(BIN)
	./$(BIN)

$(BIN): cat.hs
	ghc $(FLAGS) cat.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
