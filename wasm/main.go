//go:build js && wasm

package main

import (
	"fmt"
	"syscall/js"
)

func Add(this js.Value, args []js.Value) interface{} {
	var res float64 = 0

	for _, v := range args {
		res += v.Float()
	}

	return res
}

func main() {
	js.Global().Set("Add", js.FuncOf(Add))

	fmt.Println("WebAssembly module successfully loaded.")

	<-make(chan struct{})
}
