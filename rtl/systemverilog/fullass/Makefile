ARTIFACT=obj_dir/Vtest_fullass_chain

all: test

$(ARTIFACT): main.cpp test_fullass_chain.sv fullass_chain.sv fullass.sv
	@verilator \
		-Wall \
		--cc \
		--exe \
		main.cpp \
		test_fullass_chain.sv
	@make \
		-j \
		-C obj_dir \
		-f Vtest_fullass_chain.mk \
		Vtest_fullass_chain

test: $(ARTIFACT)
	@$(ARTIFACT)

clean:
	-rm -rf obj_dir
