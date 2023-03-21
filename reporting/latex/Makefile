.PHONY: all lint documents test clean

documents: fizzy.pdf magicnumbers.pdf naivesettheory.pdf

fizzy.pdf: fizzy.tex
	pdflatex -interaction=nonstopmode fizzy

magicnumbers.pdf: magicnumbers.tex
	pdflatex -interaction=nonstopmode magicnumbers

naivesettheory.pdf: naivesettheory.tex
	pdflatex -interaction=nonstopmode naivesettheory

lacheck:
	-for f in *.tex; do lacheck $$f; done

style-check:
	-style-check.rb *.tex

chktex:
	chktex .

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

lint: lacheck style-check chktex checkmake

test: documents

clean:
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *.synctex.gz
