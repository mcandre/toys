all: lint

funk:
	@funk .

yamllint:
	@yamllint -s .yamllint .

lint: funk yamllint
