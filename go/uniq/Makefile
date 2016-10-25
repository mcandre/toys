all: test

test:
	uniq < example.txt

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
