BIN=bin/siginttest

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is SigintTest

all: test

test: $(BIN)
	-$(BIN)

$(BIN): SigintTest.hs
	mkdir -p bin
	ghc $(FLAGS) SigintTest.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin
	-rm *.o
	-rm *.hi
