ARTIFACT=bin/wholeass

all: test

$(ARTIFACT): test_wholeass.sv wholeass.sv
	@mkdir -p bin
	@iverilog \
		-o $(ARTIFACT) \
		-g2012 \
		test_wholeass.sv \
		-Wall

test: $(ARTIFACT)
	@! vvp -n $(ARTIFACT) | \
		grep 'ERROR' -A 1

clean:
	-rm -rf bin
