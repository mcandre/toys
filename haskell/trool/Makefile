LIB=trool.o

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: $(LIB)

$(LIB): Trool.hs
	ghc $(FLAGS) Trool.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
