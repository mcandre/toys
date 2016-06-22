all: test

test: bin/Hello
	bin/Hello

bin/Hello: Hello.swift
	mkdir -p bin/
	swiftc -o bin/Hello Hello.swift

infer: clean
	infer -- make

swiftlint:
	swiftlint

lint: infer swiftlint

clean:
	-rm -rf bin/
