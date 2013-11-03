all: test

test: fizzy
	./fizzy

fizzy: fizzy.m
	clang -Wall -Wextra -Wmost -framework Foundation -lobjc -o fizzy fizzy.m

clean:
	-rm *.exe
	-rm fizzy
