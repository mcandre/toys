fizzy.pdf: fizzy.tex
	pdflatex -interaction=nonstopmode fizzy

magicnumbers.pdf: magicnumbers.tex
	pdflatex -interaction=nonstopmode magicnumbers

naivesettheory.pdf: naivesettheory.tex
	pdflatex -interaction=nonstopmode naivesettheory

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
