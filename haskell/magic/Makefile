BIN=bin/magic

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Magic

all: test

test: $(BIN)
	$(BIN)

$(BIN): Magic.hs
	mkdir -p bin/
	ghc $(FLAGS) Magic.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
