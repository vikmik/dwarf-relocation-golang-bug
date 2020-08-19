#!/bin/bash -eu
set -o pipefail

file="$1"

echo "Testing ${file}..."
echo "Actual ranges:"
llvm-dwarfdump ${file} --name=repro.c | grep -A2 DW_AT_ranges | tail -2 | sed -e 's/0x0*/0x/g' -e 's/))/)/' | tr -d ' '

echo
echo "Ranges derived from Golang's debug/elf + debug/dwarf"
./dwarf-relocation-golang-bug ${file}

