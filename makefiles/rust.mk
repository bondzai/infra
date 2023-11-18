# Makefile for Rust project

# Compiler
RUSTC = rustc

# Project name
PROJECT_NAME = my_rust_project

# Source directory
SRC_DIR = src

# Build directory
BUILD_DIR = target

# Binary output directory
BIN_DIR = $(BUILD_DIR)/debug

# Main source file
MAIN_SRC = $(SRC_DIR)/main.rs

# Binary output
BINARY = $(BIN_DIR)/$(PROJECT_NAME)

# Flags
RUSTFLAGS = -g

# Default target
.PHONY: all
all: build

# Build the project
.PHONY: build
build:
	@$(RUSTC) $(RUSTFLAGS) --out-dir $(BIN_DIR) $(MAIN_SRC)
	@echo "Build complete. Binary available at: $(BINARY)"

# Run tests
.PHONY: test
test:
	@cargo test

# Clean build artifacts
.PHONY: clean
clean:
	@cargo clean
	@echo "Cleaned up build artifacts."

# Run the binary
.PHONY: run
run:
	@$(BINARY)

# Help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make          - Build the project"
	@echo "  make test     - Run tests"
	@echo "  make clean    - Clean build artifacts"
	@echo "  make run      - Run the binary"
	@echo "  make help     - Display this help message"
