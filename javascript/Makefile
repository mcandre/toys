lint:
	find . -type f -name '*.html' -print -exec tidy -qe {} \; 2>&1 | grep -v "canvas>" | grep -v "proprietary attribute"
