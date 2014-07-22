LIB=books.o

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: $(LIB)

$(LIB): books.hs
	ghc $(FLAGS) books.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(LIB)
	-rm *.hi
