.POSIX:
.SILENT:
.PHONY: all \
	audit \
	bashate \
	lint \
	funk \
	safety \
	shellcheck \
	shfmt \
	slick \
	unmake \
	yamllint

all: lint

audit: safety

bashate:
	stank . | \
		xargs -n 1 bashate -i E006

funk:
	funk .

unmake:
	unmake .

yamllint:
	yamllint -s .yamllint .

lint: bashate funk shellcheck shfmt slick unmake yamllint

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
