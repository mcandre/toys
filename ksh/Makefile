all: lint

shlint:
	-shlint lib/

shellcheck:
	-shellcheck lib/*

checkbashisms:
	-checkbashisms -n -p lib/*

lint: shlint checkbashisms shellcheck
