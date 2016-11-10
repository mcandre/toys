all: test

test:
	99bottles

govet:
	find . -name vendor -prune -o -name '*.go' -exec go vet -v {} \;

gofmt:
	find . -name vendor -prune -o -name '*.go' -exec gofmt -s -w {} \;

lint: govet gofmt
