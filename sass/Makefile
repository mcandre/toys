all: hello.css fizzy.css

hello.css: hello.scss
	node-sass hello.scss

fizzy.css: fizzy.scss
	node-sass fizzy.scss

lint:
	find . -type f -name '*.html' -print -exec tidy -qe {} \; 2>&1 | grep -v "trimming empty"

clean:
	-rm *.css
