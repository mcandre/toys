.PHONY: test clean-artifacts clean-infer

.build/release/args: Package.swift Source/args/main.swift
	swift build -c release

all: test

test: .build/release/args
	.build/release/args a b c

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
