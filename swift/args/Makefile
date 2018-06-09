.PHONY: test clean-artifacts

.build/release/args: Package.swift Source/args/main.swift
	swift build -c release

all: test

test: .build/release/args
	.build/release/args a b c

clean-artifacts:
	-rm -rf .build

clean: clean-artifacts

swiftlint:
	swiftlint

lint: swiftlint
