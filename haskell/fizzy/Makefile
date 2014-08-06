BIN=bin/fizzy

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN)

all: test

test: $(BIN)
	$(BIN) +RTS -N

$(BIN): Fizzy.hs
	mkdir -p bin/
	ghc $(FLAGS) Fizzy.hs -threaded -rtsopts

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
