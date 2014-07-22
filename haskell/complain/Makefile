BIN=complain

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Complain

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Complain.hs
	ghc $(FLAGS) Complain.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
