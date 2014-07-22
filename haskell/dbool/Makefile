LIB=dbool.o

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: $(LIB)

$(LIB): DBool.hs
	ghc $(FLAGS) DBool.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
