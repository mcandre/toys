all: test

test:
	freq < example.txt

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
