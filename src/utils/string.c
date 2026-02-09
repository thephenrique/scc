#include <ctype.h>

#include "string.h"

long string_to_long_integer(const char *string) {
    const int decimal_base_number = 10;

    const char *cursor = string;
    char current = *cursor;
    long integer = 0;

    while (true) {
        if (isdigit(current)) {
            current -= '0';
        } else {
            break;
        }

        integer *= decimal_base_number;
        integer += current;

        current = *++cursor;
    }

    return integer;
}
