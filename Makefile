CC=cc
CFLAGS=-std=c18
CFLAGS+=-Wall -Wextra

.PHONY: all test clean

all: scc

scc: build
	$(CC) $(CFLAGS) src/main.c -o build/scc

build:
	mkdir -p build

test: scc
	@echo "\nTesting...\n"
	$(SHELL) ./tests/main_test.sh
	
clean:
	rm -rf build *.s *_test
