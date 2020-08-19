.PHONY: all test

all: test

testdata/repro:
	cd testdata && make

dwarf-relocation-golang-bug: main.go
	go build

test: testdata/repro dwarf-relocation-golang-bug
	@echo
	@echo "Running test"
	@./test.sh
