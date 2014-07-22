LIB=mool.o

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: $(LIB)

$(LIB): Mool.hs
	ghc $(FLAGS) Mool.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
