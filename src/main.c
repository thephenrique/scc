#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc != 2) {
        return 1;
    }

    long input = strtol(argv[1], NULL, 0);

    printf("  .globl main\n");
    printf("main:\n");
    printf("  mov $%ld, %%rax\n", input);
    printf("  ret\n");

    return 0;
}
