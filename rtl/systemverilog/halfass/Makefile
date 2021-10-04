ARTIFACT=bin/halfass

all: test

$(ARTIFACT): test_halfass.sv halfass.sv
	@mkdir -p bin
	@iverilog \
		-o $(ARTIFACT) \
		-g2012 \
		test_halfass.sv \
		-Wall

test: $(ARTIFACT)
	@! vvp -n $(ARTIFACT) | \
		grep 'ERROR' -A 1

clean:
	-rm -rf bin
