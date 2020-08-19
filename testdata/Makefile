.PHONY: all

all: bad good

bad: repro.c repro.ld
# The following command will likely print a warning (about a missing -T option), which should be ignored.
# Removing the warning would require passing a fully-fledged linker script to bypass gcc's default.
	gcc -g $^ -Wl,--emit-relocs -Wl,--discard-none -o $@

good: repro.c repro.ld
# Same, but without --emit-relocs
	gcc -g $^ -o $@

