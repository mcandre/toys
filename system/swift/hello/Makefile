.PHONY: test clean-artifacts

.build/release/hello: Package.swift Source/hello/main.swift
	swift build -c release

all: test

test: .build/release/hello
	.build/release/hello

clean-artifacts:
	-rm -rf .build

clean: clean-artifacts

swiftlint:
	swiftlint

lint: swiftlint
