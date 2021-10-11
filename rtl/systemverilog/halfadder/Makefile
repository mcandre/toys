ARTIFACT=obj_dir/Vtest_halfadder

all: test

$(ARTIFACT): main.cpp test_halfadder.sv halfadder.sv
	@verilator \
		-Wall \
		--cc \
		--exe \
		main.cpp \
		test_halfadder.sv
	@make \
		-j \
		-C obj_dir \
		-f Vtest_halfadder.mk \
		Vtest_halfadder

test: $(ARTIFACT)
	@$(ARTIFACT)

clean:
	-rm -rf obj_dir
