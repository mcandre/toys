BIN=bin/complain

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Complain

all: test

test: $(BIN)
	$(BIN)

$(BIN): Complain.hs
	mkdir -p bin
	ghc $(FLAGS) Complain.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin
	-rm *.o
	-rm *.hi
