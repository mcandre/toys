all: lint

safety:
	safety check

shfmt:
	stank . | xargs shfmt -w -i 4

bashate:
	stank . | xargs bashate

checkbashisms:
	stank . | xargs checkbashisms -n -p

shellcheck:
	stank . | xargs shellcheck

lint: safety shfmt bashate checkbashisms shellcheck
