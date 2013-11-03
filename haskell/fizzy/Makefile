all: test

test: fizzy
	./fizzy +RTS -N

fizzy: fizzy.hs
	ghc -O2 -Wall --make fizzy.hs -threaded -rtsopts

clean:
	-rm *.exe
	-rm *.o
	-rm *.hi
	-rm fizzy
