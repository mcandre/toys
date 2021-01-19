all: lint

bashate:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs bashate

lint: bashate
