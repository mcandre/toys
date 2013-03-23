all: test

test: fizzy
	./fizzy

fizzy: fizzy.oz
	ozc -x fizzy.oz

clean:
	-rm fizzy
	-rm *.exe
