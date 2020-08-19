#!/bin/bash -eu

echo "Actual ranges:"
llvm-dwarfdump testdata/repro --name=repro.c | grep -A2 DW_AT_ranges | tail -2 | sed 's/))/)/' | tr -d ' '

echo
echo "Ranges derived from Golang's debug/elf + debug/dwarf"
./dwarf-relocation-golang-bug

