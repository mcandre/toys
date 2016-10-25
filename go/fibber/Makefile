all: test

test:
	time fibber 20

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
