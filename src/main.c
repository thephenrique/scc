#include <stdio.h>

#include "utils/string.h"

int main(int argc, char **argv) {
    if (argc != 2) {
        return 1;
    }

    long input = string_to_long_integer(argv[1]);

    printf("  .globl main\n");
    printf("main:\n");
    printf("  mov $%ld, %%rax\n", input);
    printf("  ret\n");

    return 0;
}
