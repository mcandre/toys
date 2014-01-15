all: hello.css fizzy.css

hello.css: hello.styl
	stylus hello.styl

fizzy.css: fizzy.styl
	stylus fizzy.styl

lint:
	find . -type f -name '*.html' -prune ! -path "*/node_modules/*" -print -exec tidy -qe {} \; 2>&1 | grep -v "trimming empty"

clean:
	-rm *.css
