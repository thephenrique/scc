#!/bin/bash

assert() {
    expected="$1"
    input="$2"

    ./build/scc "$input" >main_asm_test.s || exit
    cc -static -o main_test main_asm_test.s
    ./main_test

    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "FAIL: $input => $expected expected, but got $actual"
        exit 1
    fi
}

# 0 -> 255

assert 0 0
assert 1 1
assert 255 255

assert 0 256
assert 1 257

assert 255 -1
assert 254 -2

assert 20 '20-4+2-10+8+4'
assert 20 '20 - 4 + 2 - 10 + 8 + 4'

echo
echo OK
