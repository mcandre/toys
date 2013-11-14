compile:
	for f in *.erl; do erlc -Wall +debug_info $$f; done

~/.dialyzer_plt: compile
	dialyzer *.beam --build_plt --quiet

lint: ~/.dialyzer_plt
	dialyzer *.beam

clean:
	-rm *.beam
