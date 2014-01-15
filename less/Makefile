all: hello.css fizzy.css

hello.css: hello.less
	lessc hello.less > hello.css

fizzy.css: fizzy.less
	lessc fizzy.less > fizzy.css

lint:
	find . -type f -name '*.html' -print -exec tidy -qe {} \; 2>&1 | grep -v "trimming empty"

clean:
	-rm *.css
