This is a standalone repro case for https://github.com/golang/go/issues/40879

* `testdata` contains logic to build an executable `testdata/repro` that:
    * has a `.rela.debug_ranges` section
    * has a DWARF DIE that uses DW_AT_ranges (to force this, I used a linker script to spread the code across 2 sections at different addresses)
* `main.go` contains logic that prints the PC ranges of `testdata/repro`
* `test.sh` will print the PC ranges using both the Go binary, and `llvm-dwarfdump`, to highlight the difference
* `make` will compile all binaries and run `test.sh`

Note: you need `llvm` installed (for `llvm-dwarfdump`). Alternatively you can change the test.sh script to use the regular `dwarfdump`.
