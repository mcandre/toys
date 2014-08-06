BIN=bin/roll

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Roll

all: test

test: $(BIN)
	$(BIN) 2d6

$(BIN): Roll.hs
	mkdir -p bin/
	ghc $(FLAGS) Roll.hs -package MissingH -package random-fu -package random-source

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
