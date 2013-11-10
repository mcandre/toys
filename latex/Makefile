fizzy.pdf: fizzy.tex
	pdflatex fizzy

magicnumbers.pdf: magicnumbers.tex
	pdflatex magicnumbers

naivesettheory.pdf: naivesettheory.tex
	pdflatex naivesettheory

guard: Guardfile
	guard

lacheck:
	-for f in *.tex; do lacheck $$f; done

style-check:
	-style-check.rb *.tex

lint: lacheck style-check

clean:
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *.synctex.gz
