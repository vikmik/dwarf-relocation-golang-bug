.PHONY: all test testbinaries

all: test

testbinaries:
	cd testdata && make

dwarf-relocation-golang-bug: main.go
	go build

test: testbinaries dwarf-relocation-golang-bug
	@echo "-------------------------"
	@./test.sh testdata/good
	@echo
	@echo "-------------------------"
	@./test.sh testdata/bad
	@echo "-------------------------"
