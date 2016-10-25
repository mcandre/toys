all: test

test:
	ddg g dogs

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
