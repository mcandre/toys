BIN=hello

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Hello.hs
	ghc $(FLAGS) Hello.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
