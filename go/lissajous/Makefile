BIN=bin/lissajous

all: test

test: $(BIN)
	$(BIN) > example.gif

$(BIN): lissajous.go
	go build -o $(BIN) lissajous.go

clean:
	-rm -rf bin
