#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "%s invalid number of arguments\n", argv[0]);
    return 1;
  }

  char *input = argv[1];

  printf("  .globl main\n");
  printf("main:\n");
  printf("  mov $%ld, %%rax\n", strtol(input, &input, 10));

  while (*input) {
    if (isspace(*input)) {
      input++;
      continue;
    }

    if (*input == '+') {
      input++;
      printf("  add $%ld, %%rax\n", strtol(input, &input, 10));
      continue;
    }

    if (*input == '-') {
      input++;
      printf("  sub $%ld, %%rax\n", strtol(input, &input, 10));
      continue;
    }

    fprintf(stderr, "unexpected character: %c", *input);
    return 1;
  }

  printf("  ret\n");

  return 0;
}
