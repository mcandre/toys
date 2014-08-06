FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp

CAT=bin/cat
PETSTORE=bin/petstore

all: test

test: $(CAT) $(PETSTORE)
	$(CAT)
	$(PETSTORE)

$(CAT): Cat.hs
	mkdir -p bin/
	ghc $(FLAGS) -o $(CAT) -main-is Cat Cat.hs

$(PETSTORE): Petstore.hs Cat.hs Dog.hs
	mkdir -p bin/
	ghc $(FLAGS) -o $(PETSTORE) -main-is Petstore Petstore.hs Cat.hs Dog.hs

hlint:
	hlint .

lint: hlint

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
