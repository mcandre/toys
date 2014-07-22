BIN=philabuster

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Philabuster

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Philabuster.hs
	ghc $(FLAGS) Philabuster.hs -package MissingH -package random-fu -package random-source

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
