all: test

test:
	trool

govet:
	find . -name vendor -prune -o -name '*.go' -exec go vet -v {} \;

gofmt:
	find . -name vendor -prune -o -name '*.go' -exec gofmt -s -w {} \;

lint: govet gofmt
