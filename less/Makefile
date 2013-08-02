all: hello.css fizzy.css

hello.css: hello.less
	lessc hello.less > hello.css

fizzy.css: fizzy.less
	lessc fizzy.less > fizzy.css

clean:
	-rm *.css
