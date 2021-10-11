ARTIFACT=obj_dir/Vtest_fulladder_chain

all: test

$(ARTIFACT): main.cpp test_fulladder_chain.sv fulladder_chain.sv fulladder.sv
	@verilator \
		-Wall \
		-Wno-UNOPTFLat \
		--cc \
		--exe \
		main.cpp \
		test_fulladder_chain.sv
	@make \
		-j \
		-C obj_dir \
		-f Vtest_fulladder_chain.mk \
		Vtest_fulladder_chain

test: $(ARTIFACT)
	@$(ARTIFACT)

clean:
	-rm -rf obj_dir
