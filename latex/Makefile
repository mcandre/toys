fizzy.pdf: fizzy.tex
	pdflatex fizzy

magicnumbers.pdf: magicnumbers.tex
	pdflatex magicnumbers

naivesettheory.pdf: naivesettheory.tex
	pdflatex naivesettheory

guard: Guardfile
	guard

lint:
	for f in *.tex; do lacheck $$f; done

clean:
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *.synctex.gz
