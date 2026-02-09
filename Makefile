CC     := gcc
CFLAGS := -std=c23
CFLAGS := $(CFLAGS) -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Werror -O2

.PHONY: all clean test

all: scc

scc: build
	$(CC) $(CFLAGS) src/main.c -o build/scc

build:
	mkdir -p build

test: scc
	@echo ""
	@echo "Testing..."
	$(SHELL) ./test/main_test.sh
	
clean:
	rm -rf build .cache compile_commands.json *_temp_test
