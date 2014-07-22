LIB=books.o

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: $(LIB)

$(LIB): Books.hs
	ghc $(FLAGS) Books.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm $(LIB)
	-rm *.hi
