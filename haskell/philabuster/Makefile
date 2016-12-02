BIN=bin/philabuster

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Philabuster

all: test

test: $(BIN)
	$(BIN)

$(BIN): Philabuster.hs
	mkdir -p bin
	ghc $(FLAGS) Philabuster.hs -package MissingH -package random-fu -package random-source

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin
	-rm *.o
	-rm *.hi
