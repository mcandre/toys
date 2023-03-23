.PHONY: all lint test clean

compile:
	for f in *.erl; do erlc -Wall +debug_info $$f; done

plt:
	dialyzer *.beam --build_plt --apps erts kernel stdlib

dialyzer: compile
	dialyzer *.beam --quiet

checkmake:
	@find . \
		-type f \
		\( \
			-iname Makefile -o \
			-iname GNUmakefile -o \
			-iname '*.mk' -o \
			-iname '*.make' \
		\) \
		-print0 | \
			xargs -0 -n 1 checkmake

lint: dialyzer checkmake

test:
	@echo "nothing to do"

clean:
	-rm *.beam
