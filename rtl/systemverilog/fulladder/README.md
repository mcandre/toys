# fulladder: an n-bit adding machine

Alternative title: *The world's dumbest ISA*

fulladder implements basic unsigned integer addition with raw logic gates (ignores any available DSP components).

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
