all: test

test: bin/Hello
	bin/Hello

bin/Hello: Hello.swift
	mkdir -p bin/
	swiftc -o bin/Hello Hello.swift

infer: clean
	infer -- make

lint: infer

clean:
	-rm -rf bin/
