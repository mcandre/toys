.PHONY: test clean-artifacts clean-infer

.build/release/hello: Package.swift Source/hello/main.swift
	swift build -c release

all: test

test: .build/release/hello
	.build/release/hello

clean-artifacts:
	-rm -rf .build

clean-infer:
	-rm -rf infer-out

clean: clean-artifacts clean-infer

swiftlint:
	swiftlint

infer: clean
	infer -- make

lint: swiftlint infer
