lint: phplint csslint

phplint:
	-for f in *.php; do php -l $$f | grep -v "No syntax errors detected"; done

csslint:
	csslint .
