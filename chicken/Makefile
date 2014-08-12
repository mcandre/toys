all: lint

lint: csc

csc:
	mkdir -p bin/
	for f in *.scm; do csc -o bin/`basename $$f .scm` $$f; done

clean:
	-rm -rf bin/
