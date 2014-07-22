BIN=siginttest

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is SigintTest

all: test

test: $(BIN)
	-./$(BIN)

$(BIN): SigintTest.hs
	ghc $(FLAGS) SigintTest.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
