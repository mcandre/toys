ARTIFACT=obj_dir/Vtest_halfass

all: test

$(ARTIFACT): main.cpp test_halfass.sv halfass.sv
	@verilator \
		-Wall \
		--cc \
		--exe \
		main.cpp \
		test_halfass.sv
	@make \
		-j \
		-C obj_dir \
		-f Vtest_halfass.mk \
		Vtest_halfass

test: $(ARTIFACT)
	@$(ARTIFACT)

clean:
	-rm -rf obj_dir
