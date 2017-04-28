/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int power (unsigned int n, unsigned int m);
extern long long int multiply (unsigned int a, unsigned int b);

int main(void)
{
    long long int a = power(3, 5);
    printf("Result of power(3, 5) = %llu\n", a);
    return 0;
}

/* Number of instructions:
 * - Breakpoint at line 10: 420
 * - Breakpoint at line 11: 3357
 */
