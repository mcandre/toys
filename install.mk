.POSIX:
.SILENT:
.PHONY: all

all:
	cargo install --force unmake@0.0.12

	go install github.com/mcandre/stank/...@v0.0.24
	go install mvdan.cc/sh/v3/cmd/shfmt@latest
	go mod tidy

	pip3 install --upgrade pip setuptools
	pip3 install -r requirements-dev.txt
