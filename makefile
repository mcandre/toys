.POSIX:
.SILENT:
.PHONY: all \
	audit \
	lint \
	funk \
	safety \
	unmake \
	yamllint

all: lint

audit: safety

funk:
	funk .

unmake:
	unmake .

yamllint:
	yamllint -s .yamllint .

lint: funk unmake yamllint

safety:
	safety check
