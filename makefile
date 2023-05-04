.POSIX:
.SILENT:
.PHONY: all \
	lint \
	funk \
	unmake \
	yamllint

all: lint

funk:
	funk .

unmake:
	unmake .

yamllint:
	yamllint -s .yamllint .

lint: funk unmake yamllint
