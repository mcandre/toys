.PHONY: all lint test clean

WIDTH=8

ARTIFACT=obj_dir/Vfulladder_chain

all: test

$(ARTIFACT): Makefile main.cpp fulladder_chain.sv fulladder.sv
	@verilator \
		-Wall \
		-Wno-UNOPTFLat \
		-GWIDTH=$(WIDTH) \
		--cc \
		--exe \
		main.cpp \
		fulladder_chain.sv
	@CXXFLAGS=-DWIDTH=$(WIDTH) make \
		-j \
		-C obj_dir \
		-f Vfulladder_chain.mk \
		Vfulladder_chain

checkmake:
	@find . \
		-type f \
		\( \
			-iname Makefile -o \
			-iname GNUmakefile -o \
			-iname '*.mk' -o \
			-iname '*.make' \
		\) \
		-print0 | \
			xargs -0 -n 1 checkmake

lint: checkmake

test: $(ARTIFACT)
	@$(ARTIFACT)

clean:
	-rm -rf obj_dir
