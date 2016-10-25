all: test

test:
	hello

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
