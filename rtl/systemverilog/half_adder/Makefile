ARTIFACT=bin/half_adder

all: $(ARTIFACT)

$(ARTIFACT): half_adder.sv
	mkdir -p bin
	iverilog -o $(ARTIFACT) half_adder.sv -Wall

test: $(ARTIFACT)
	vvp -n $(ARTIFACT)

clean:
	-rm -rf bin
