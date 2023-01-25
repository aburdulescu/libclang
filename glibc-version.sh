#!/bin/sh

set -e

echo '#include <gnu/libc-version.h>
#include <stdio.h>

int main() {
    puts(gnu_get_libc_version());
}' > glibc.c

gcc glibc.c && ./a.out

rm -f glibc.c a.out
