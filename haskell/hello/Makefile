BIN=bin/hello

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	$(BIN)

$(BIN): Hello.hs
	mkdir -p bin/
	ghc $(FLAGS) Hello.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
