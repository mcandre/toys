.POSIX:
.SILENT:
.IGNORE: clean
.PHONY: all \
	lint \
	compile \
	plt \
	dialyzer \
	unmake \
	test \
	clean

all: test

compile:
	for f in *.erl; do erlc -Wall +debug_info $$f; done

plt:
	dialyzer *.beam --build_plt --apps erts kernel stdlib

dialyzer: compile
	dialyzer *.beam --quiet

unmake:
	unmake .

lint: dialyzer unmake

test:
	echo "nothing to do"

clean:
	rm *.beam
