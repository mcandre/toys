BIN=bin/lissajous

all: test

test: $(BIN)
	$(BIN) > example.gif

$(BIN): lissajous.go
	go build -o $(BIN) lissajous.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin
