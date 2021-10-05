ARTIFACT=obj_dir/Vtest_wholeass

all: test

$(ARTIFACT): main.cpp test_wholeass.sv wholeass.sv
	@verilator \
		-Wall \
		--cc \
		--exe \
		main.cpp \
		test_wholeass.sv
	@make \
		-j \
		-C obj_dir \
		-f Vtest_wholeass.mk \
		Vtest_wholeass

test: $(ARTIFACT)
	@$(ARTIFACT)

clean:
	-rm -rf obj_dir
