.POSIX:
.SILENT:
.PHONY: all lint csc unmake clean
.IGNORE: clean

FLAGS=-O2

all: lint

csc:
	mkdir -p bin
	for f in *.scm; do csc $(FLAGS) -o bin/$$(basename $$f .scm) $$f; done

unmake:
	unmake .

lint: csc unmake

clean:
	rm -rf bin
