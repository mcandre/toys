.PHONY: all lint test clean

all: lint

funk:
	@funk .

yamllint:
	@yamllint -s .yamllint .

unmake:
	@unmake makefile
	@unmake install.mk

lint: funk yamllint unmake

test: lint

clean:
	@echo "nothing to do"
