build : build_wasm


WASM_BUILD_DIR := ../static

export GOOS = js
export GOARCH = wasm

build_wasm :
	cd wasm && \
	go build -o "$(WASM_BUILD_DIR)/wasm.wasm" && \
	cp "$(shell go env GOROOT)/lib/wasm/wasm_exec.js" "$(WASM_BUILD_DIR)/" && \
	cd ..


.PHONY : build build_wasm
