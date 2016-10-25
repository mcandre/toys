all: test

test:
	args a b c

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
