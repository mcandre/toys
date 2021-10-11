# fulladder_chain: an n-bit adding and subracting machine

Alternative title: *The world's dumbest ISA*

fulladder_chain implements basic integer addition and subtraction via raw logic gates (ignores any available DSP components).

Subraction is implemented in terms of negative inputs.

Binary format: Either unsigned or two's complement.

If you want to add n-bit negative values and/or subtract n-bit values, then expand `WIDTH` to 2n.

# PRECONDITIONS

* `WIDTH` > 0

# TEST

```console
$ make
```

# REQUIREMENTS

* [g++](https://gcc.gnu.org/) 9+
* [GNU make](https://www.gnu.org/software/make/) 4+
* [verilator](https://www.veripool.org/verilator/) 4.212-48-g2560fc86 or higher
