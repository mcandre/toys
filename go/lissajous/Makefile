all: test

test:
	lissajous > example.gif

govet:
	go list ./... | grep -v vendor | xargs go vet -v

golint:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec golint {} \;

gofmt:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec gofmt -s -w {} \;

goimport:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec goimports -w {} \;

errcheck:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec errcheck {} \;

lint: govet golint gofmt goimport errcheck
