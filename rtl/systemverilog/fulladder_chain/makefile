.POSIX:
.SILENT:
.IGNORE: clean
.PHONY: all lint unmake test clean

WIDTH=8

ARTIFACT=obj_dir/Vfulladder_chain

all: test

$(ARTIFACT): Makefile main.cpp fulladder_chain.sv fulladder.sv
	verilator \
		-Wall \
		-Wno-UNOPTFLat \
		-GWIDTH=$(WIDTH) \
		--cc \
		--exe \
		main.cpp \
		fulladder_chain.sv
	CXXFLAGS=-DWIDTH=$(WIDTH) make \
		-j \
		-C obj_dir \
		-f Vfulladder_chain.mk \
		Vfulladder_chain

unmake:
	unmake .

lint: unmake

test: $(ARTIFACT)
	$(ARTIFACT)

clean:
	rm -rf obj_dir
