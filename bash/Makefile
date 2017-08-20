all: lint

shfmt:
	stank lib | xargs shfmt -w -i 4

bashate:
	stank lib | xargs bashate

sh-syntax:
	stank lib | xargs bash -n

shellcheck:
	stank lib | xargs shellcheck

lint: shfmt bashate sh-syntax shellcheck
