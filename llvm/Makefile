all: fizzy

fizzy: fizzy.ll
	llvm-as fizzy.ll
	llc fizzy.bc
	gcc -o fizzy fizzy.s

clean:
	-rm fizzy
	-rm fizzy.s
	-rm fizzy.bc