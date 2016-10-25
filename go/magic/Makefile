all: test

test:
	magic

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
