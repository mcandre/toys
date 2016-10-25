all: test

test:
	lissajous > example.gif

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
