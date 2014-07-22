FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: test

test: fizzy
	./fizzy +RTS -N

fizzy: fizzy.hs
	ghc $(FLAGS) fizzy.hs -threaded -rtsopts

hlint:
	hlint .

lint: hlint

clean:
	-rm *.exe
	-rm *.o
	-rm *.hi
	-rm fizzy
