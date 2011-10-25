all: fizzy

fizzy: fizzy.ll
	llvm-as fizzy.ll
	llc -O2 fizzy.bc
	gcc -o fizzy -O2 fizzy.s

clean:
	-rm fizzy
	-rm fizzy.s
	-rm fizzy.bc