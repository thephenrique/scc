CC=clang
CFLAGS=-std=c18
CFLAGS+=-Wall -Wextra -Weverything -pedantic -g -O0 -fstack-protector-strong -fsanitize=address -fsanitize=undefined -D_FORTIFY_SOURCE=2
CFLAGS+=-Wno-declaration-after-statement -Wno-unsafe-buffer-usage -Wno-padded

all: build
	$(CC) $(CFLAGS) $(LIBS) src/main.c -o build/small-cc

build:
	mkdir -p build

clean:
	rm -rf build
