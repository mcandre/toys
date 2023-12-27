.POSIX:
.SILENT:
.PHONY: \
	all \
	audit \
	bashate \
	funk \
	lint \
	safety \
	shellcheck \
	shfmt \
	slick \
	unmake

all: lint

audit: safety

lint: \
	bashate \
	funk \
	shellcheck \
	shfmt \
	slick \
	unmake

bashate:
	stank . | \
		xargs -n 1 bashate -i E006

funk:
	funk .

safety:
	safety check

shellcheck:
	stank -exInterp zsh . | \
		xargs -n 1 shellcheck

shfmt:
	stank -exInterp zsh . | \
		xargs -n 1 shfmt -w -i 4

slick:
	stank -sh . | \
		xargs -n 1 slick

unmake:
	unmake .
