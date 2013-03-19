all: fizzy

fizzy: fizzy.hs
	ghc --make fizzy.hs -threaded -rtsopts
	./fizzy +RTS -N

clean:
	-rm fizzy
	-rm fizzy.o
	-rm fizzy.hi
