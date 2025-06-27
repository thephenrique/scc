CC=clang
CFLAGS=-std=c18
CFLAGS+=-Wall -Wextra -Weverything -pedantic -g -O0 -fstack-protector-strong -fsanitize=address -fsanitize=undefined -D_FORTIFY_SOURCE=2
CFLAGS+=-Wno-declaration-after-statement -Wno-unsafe-buffer-usage -Wno-padded

scc: build
	$(CC) $(CFLAGS) $(LIBS) src/main.c -o build/scc

.PHONY: build
build:
	mkdir -p build

.PHONY: test
test: scc
	echo "\nTesting...\n"
	bash ./src/main_test.sh
	
.PHONY: clean
clean:
	rm -rf build *.s *_test
