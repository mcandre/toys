all: lint

shfmt:
	stank lib | xargs shfmt -w -i 4

bashate:
	stank lib | xargs bashate

sh-syntax:
	stank lib | xargs zsh -n

lint: shfmt bashate sh-syntax
