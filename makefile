.POSIX:
.SILENT:
.PHONY: all \
	audit \
	bashate \
	funk \
	lint \
	safety \
	shellcheck \
	shfmt \
	slick \
	unmake \
	yamllint

all: lint

audit: safety

bashate:
	stank -exInterp zsh . | \
		grep -v .sample | \
		xargs -n 1 bashate -i E006

funk:
	funk .

lint: \
	bashate \
	funk \
	shellcheck \
	shfmt \
	slick \
	unmake \
	yamllint

safety:
	safety check

shellcheck:
	stank -exInterp zsh . | \
		grep -v .sample | \
		xargs -n 1 shellcheck

shfmt:
	stank -exInterp zsh . | \
		grep -v .sample | \
		xargs -n 1 shfmt -w -i 4

slick:
	stank -sh . | \
		grep -v .sample | \
		xargs -n 1 slick

unmake:
	unmake .

yamllint:
	yamllint -s .yamllint .
