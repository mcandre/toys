all: lint

shlint:
	-shlint lib/

shellcheck:
	-shellcheck lib/*

checkbashisms:
	-checkbashisms lib/*

lint: shlint checkbashisms shellcheck
