/* main.c simple program to test assembler program */

#include <stdio.h>

extern unsigned long long int multiply(long long int a, long long int b);

int main(void)
{
    unsigned long long int m = multiply(0, 0);
    printf("Result of multiply(0, 0) = %ld\n", m);
    return 0;
}
