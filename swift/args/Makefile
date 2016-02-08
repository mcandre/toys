all: test

test: bin/Args
	bin/Args

bin/Args: Args.swift
	mkdir -p bin/
	swiftc -o bin/Args Args.swift

infer: clean
	infer -- make

lint: infer

clean:
	-rm -rf bin/
