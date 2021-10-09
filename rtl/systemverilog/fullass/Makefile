ARTIFACT=obj_dir/Vtest_fullass

all: test

$(ARTIFACT): main.cpp test_fullass.sv fullass.sv
	@verilator \
		-Wall \
		--cc \
		--exe \
		main.cpp \
		test_fullass.sv
	@make \
		-j \
		-C obj_dir \
		-f Vtest_fullass.mk \
		Vtest_fullass

test: $(ARTIFACT)
	@$(ARTIFACT)

clean:
	-rm -rf obj_dir
