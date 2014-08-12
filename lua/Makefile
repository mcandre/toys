all: lint

lint: luac

luac:
	mkdir -p bin/
	for f in *.lua; do luac -o bin/`basename $$f .lua`.luac $$f; done

clean:
	-rm -rf bin/
