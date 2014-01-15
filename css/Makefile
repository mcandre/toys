lint: csslint tidy

csslint:
	csslint .

tidy:
	find . -type f -name '*.html' -print -exec tidy -qe {} \; 2>&1 | grep -v "trimming empty"
