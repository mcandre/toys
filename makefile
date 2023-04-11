.PHONY: all lint test clean

all: lint

funk:
	@funk .

yamllint:
	@yamllint -s .yamllint .

unmake:
	@unmake makefile

lint: funk yamllint unmake

test: lint

clean:
	@echo "nothing to do"
