BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.go
	mkdir -p bin
	go build -o $(BIN) hello.go

clean:
	-rm -rf bin
