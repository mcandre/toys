FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

all: test

test: cat petstore
	./cat
	./petstore

cat: Cat.hs
	ghc $(FLAGS) -o cat -main-is Cat Cat.hs

petstore: Petstore.hs Cat.hs Dog.hs
	ghc $(FLAGS) -o petstore -main-is Petstore Petstore.hs Cat.hs Dog.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm petstore
	-rm cat
	-rm *.exe
	-rm *.o
	-rm *.hi
