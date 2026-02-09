#!/bin/bash

assert_exit() {
  expected="$1"
  source="$2"

  ./build/scc "$source" >main_asm_temp_test.s || exit
  gcc -static -o main_temp_test main_asm_temp_test.s
  ./main_temp_test

  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "OK: '$source' => $actual"
  else
    echo "FAIL: '$source' => expected $expected, got $actual"
    exit 1
  fi
}

assert_exit 0 '0'
assert_exit 32 '32'
