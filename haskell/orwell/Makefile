LIB=orwell.o

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: $(LIB)

$(LIB): Orwell.hs
	ghc $(FLAGS) Orwell.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
