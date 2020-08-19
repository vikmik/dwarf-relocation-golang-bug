package main

import (
	"debug/elf"
	"fmt"
	"log"
	"os"
)

func main() {
	file, err := elf.Open(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	dw, err := file.DWARF()
	if err != nil {
		log.Fatal(err)
	}

	reader := dw.Reader()

	// The first entry will be the (only) CU
	entry, err := reader.Next()
	if err != nil {
		log.Fatal(err)
	}

	// Read PC ranges from DIE
	ranges, err := dw.Ranges(entry)
	if err != nil {
		log.Fatal(err)
	}

	for i := range ranges {
		fmt.Printf("[0x%x, 0x%x)\n", ranges[i][0], ranges[i][1])
	}
}
