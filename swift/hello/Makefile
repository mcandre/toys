.PHONY: clean-bin clean-infer

all: test

test: bin/Hello
	bin/Hello

bin/Hello: Hello.swift
	mkdir -p bin
	swiftc -o bin/Hello Hello.swift

infer: clean
	infer -- make

swiftlint:
	swiftlint

lint: infer swiftlint

clean: clean-bin clean-infer

clean-bin:
	-rm -rf bin

clean-infer:
	-rm -rf infer-out
