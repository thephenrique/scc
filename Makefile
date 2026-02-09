CC               := gcc -std=c23

OPT_DEV          := -Og -g3 -fno-omit-frame-pointer
OPT_ASSEMBLY     := -S -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fverbose-asm

WARN_FLAGS       := -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Wformat=2 \
                    -Wcast-qual -Wwrite-strings -Wstrict-prototypes -Wvla -Wswitch-enum \
                    -Wundef -Wmissing-prototypes -Wmissing-declarations -Wsign-conversion \
                    -Wnull-dereference -Wcast-align -Wpointer-arith -Wstrict-overflow=4 -Wfloat-equal

CFLAGS_COMMON    := $(CC) $(WARN_FLAGS)

CFLAGS_DEV       := $(CFLAGS_COMMON) $(OPT_DEV)
CFLAGS_ASSEMBLY  := $(CFLAGS_COMMON) $(OPT_ASSEMBLY)

.PHONY: all dev assembly test clean

all: dev

dev:
	@mkdir -p build
	$(CFLAGS_DEV) src/utils/string.c src/main.c -o build/scc

assembly:
	@mkdir -p build
	$(CFLAGS_ASSEMBLY) src/main.c -o build/scc.s

test: dev
	@mkdir -p build/test
	@echo ""
	@echo "Testing..."
	$(SHELL) ./test/main_test.sh
	
clean:
	rm -rf build .cache compile_commands.json


