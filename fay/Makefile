tidy:
	find . -type d -name node_modules -prune -o -type f -name '*.html' \( -exec tidy -qe {} \; -o -print \) 2>&1 | grep -v 'canvas>' | grep -v 'proprietary attribute'; true

lint: tidy
