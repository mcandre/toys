.PHONY: all lint test clean

ARTIFACT=obj_dir/Vhalfadder

all: test

$(ARTIFACT): Makefile main.cpp halfadder.sv
	@verilator \
		-Wall \
		--cc \
		--exe \
		main.cpp \
		halfadder.sv
	@make \
		-j \
		-C obj_dir \
		-f Vhalfadder.mk \
		Vhalfadder

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
