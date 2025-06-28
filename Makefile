CC=clang
CFLAGS=-std=c18
CFLAGS+=-Wall -Wextra -Weverything -pedantic -g -O0 -fstack-protector-strong -fsanitize=address -fsanitize=undefined -D_FORTIFY_SOURCE=2
CFLAGS+=-Wno-declaration-after-statement -Wno-unsafe-buffer-usage -Wno-padded

.PHONY: all test clean

all: scc

scc: build
	$(CC) $(CFLAGS) $(LIBS) src/main.c -o build/scc

build:
	mkdir -p build

test: scc
	@echo "\nTesting...\n"
	$(SHELL) ./tests/main_test.sh
	
clean:
	rm -rf build *.s *_test
