all: lint

shlint:
	-shlint lib/

checkbashisms:
	-checkbashisms -n -p lib/*

lint: shlint checkbashisms
