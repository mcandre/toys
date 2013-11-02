all: fizzy

fizzy: fizzy.hs
	ghc --make fizzy.hs -threaded -rtsopts -Wall
	./fizzy +RTS -N

clean:
	-rm fizzy
	-rm fizzy.o
	-rm fizzy.hi
