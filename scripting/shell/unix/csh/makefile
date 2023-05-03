.POSIX:
.PHONY: all lint bashate funk unmake test clean

all: lint

bashate:
	@stank . | xargs bashate

funk:
	@funk

unmake:
	@unmake .

lint: bashate funk unmake

test:
	@echo "nothing to do"

clean:
	@echo "nothing to do"
