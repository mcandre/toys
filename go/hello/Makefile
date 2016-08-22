BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.go
	go build -o $(BIN) hello.go

clean:
	-rm -rf bin
