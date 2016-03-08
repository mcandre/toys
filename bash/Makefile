all: lint

shlint:
	-shlint lib/

shellcheck:
	-shellcheck lib/*

checkbashisms:
	-checkbashisms -n -p lib/*

bashate:
	-bashate lib/*

lint: shlint checkbashisms shellcheck bashate
