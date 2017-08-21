all: lint

shfmt:
	stank lib | xargs shfmt -w -i 4

bashate:
	stank lib | xargs bashate

shlint:
	stank lib | xargs shlint

checkbashisms:
	stank lib | xargs checkbashisms -n -p

lint: shfmt bashate shlint checkbashisms
