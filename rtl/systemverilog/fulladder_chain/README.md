# fulladder_chain: n-bit adding machine

# TEST

```console
$ make
```

# REQUIREMENTS

* [verilator](https://www.veripool.org/verilator/) 4.212-48-g2560fc86 or higher
* [g++](https://gcc.gnu.org/) 9+
* [GNU make](https://www.gnu.org/software/make/)
* GNU compatible [findutils](https://www.gnu.org/software/findutils/)
* [Go](https://golang.org/) 1.20.2+ with `go install github.com/mcandre/accio/cmd/accio@v0.0.4` and `accio -install`
* [Python](https://www.python.org/) 3.11.2+ with `pip[3] install --upgrade pip setuptools` and `pip[3] install -r requirements-dev.txt`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10
* [direnv](https://direnv.net/) 2

# SEE ALSO

[alluvial](https://github.com/mcandre/alluvial), a poor man's ISA
