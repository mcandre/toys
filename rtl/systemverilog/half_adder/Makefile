ARTIFACT=bin/half_adder

all: $(ARTIFACT)

$(ARTIFACT): test_half_adder.sv half_adder.sv
	@mkdir -p bin
	@iverilog -o $(ARTIFACT) -g2012 test_half_adder.sv -Wall

test: $(ARTIFACT)
	@! vvp -n $(ARTIFACT) | \
		grep 'ERROR' -A 1

clean:
	-rm -rf bin
