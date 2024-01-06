.POSIX:
.SILENT:
.IGNORE: clean
.PHONY: all lint unmake test clean

ARTIFACT=obj_dir/Vhalfadder

all: test

$(ARTIFACT): main.cpp halfadder.sv
	verilator \
		-Wall \
		--cc \
		--exe \
		main.cpp \
		halfadder.sv
	make \
		-j \
		-C obj_dir \
		-f Vhalfadder.mk \
		Vhalfadder

unmake:
	unmake .

lint: unmake

test: $(ARTIFACT)
	$(ARTIFACT)

clean:
	rm -rf obj_dir
