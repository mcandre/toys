BIN=bin/ulines

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is ULines

all: test

test: $(BIN)
	$(BIN)

$(BIN): ULines.hs
	mkdir -p bin
	ghc $(FLAGS) ULines.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin
	-rm *.o
	-rm *.hi
