#!/bin/bash

CC=gcc
SCC=./build/scc
OUTPUT_DIR=build/test

assert_exit() {
  expected="$1"
  source="$2"

  $SCC "$source" >$OUTPUT_DIR/main_test.s || exit
  $CC $OUTPUT_DIR/main_test.s -o $OUTPUT_DIR/main_test

  ./$OUTPUT_DIR/main_test
  result="$?"

  if [ "$result" = "$expected" ]; then
    echo "OK: '$source' => $result"
  else
    echo "FAIL: '$source' => expected $expected, got $result"
    exit 1
  fi
}

assert_exit 0 '0'
assert_exit 32 '32'
