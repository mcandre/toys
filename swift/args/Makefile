.PHONY: clean-bin clean-infer

all: test

test: bin/Args
	bin/Args

bin/Args: Args.swift
	mkdir -p bin
	swiftc -o bin/Args Args.swift

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
