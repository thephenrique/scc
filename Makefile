CC               := gcc -std=c23

OPT_SANITIZE     := -O1 -g3 -fno-omit-frame-pointer \
                    -fsanitize=address,undefined -fno-sanitize-recover=all
OPT_DEBUG        := -Og -g3 -fno-omit-frame-pointer
OPT_RELEASE      := -O2

WARN_FLAGS       := -Wall -Wextra -Wpedantic -Wshadow -Wconversion
EXTRA_WARN_FLAGS := -Wformat=2 -Wcast-qual -Wwrite-strings -Wstrict-prototypes \
                    -Wvla -Wswitch-enum -Wundef -Wmissing-prototypes -Wmissing-declarations
WERROR_FLAGS     := -Werror
HARDENING_FLAGS  := -fstack-protector-strong -D_FORTIFY_SOURCE=2 -fno-common -fPIE -pie

CFLAGS_COMMON    := $(CC) $(WARN_FLAGS) $(EXTRA_WARN_FLAGS) $(WERROR_FLAGS)
CFLAGS_SANITIZE  := $(CFLAGS_COMMON) $(OPT_SANITIZE)
CFLAGS_DEBUG     := $(CFLAGS_COMMON) $(OPT_DEBUG)
CFLAGS_RELEASE   := $(CFLAGS_COMMON) $(OPT_RELEASE) $(HARDENING_FLAGS)

.PHONY: all sanitize debug release clean test

all: sanitize

sanitize:
	@mkdir -p build
	$(CFLAGS_SANITIZE) src/main.c -o build/scc

debug:
	@mkdir -p build
	$(CFLAGS_DEBUG) src/main.c -o build/scc

release:
	@mkdir -p build
	$(CFLAGS_RELEASE) src/main.c -o build/scc

test: sanitize
	@mkdir -p build/test
	@echo ""
	@echo "Testing..."
	$(SHELL) ./test/main_test.sh
	
clean:
	rm -rf build .cache compile_commands.json
