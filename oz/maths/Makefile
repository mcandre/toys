all: test

test: maths
	./maths

maths: maths.oz
	ozc -x maths.oz

clean:
	-rm maths
	-rm *.exe
