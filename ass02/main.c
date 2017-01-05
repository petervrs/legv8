/* main.c simple program to test assembler program */

#include <stdio.h>

extern unsigned long long int multiply(long long int a, long long int b);

int main(void)
{
    unsigned long long int m = multiply(0, 0);
    printf("Result of multiply(0, 0) = %ld\n", m);

    m = multiply(1, 0);
	printf("Result of multiply(1, 0) = %ld\n", m);

	m = multiply(0, 1);
	printf("Result of multiply(0, 1) = %ld\n", m);

	m = multiply(1, 1);
	printf("Result of multiply(1, 1) = %ld\n", m);

	m = multiply(1, 4294967295);
	printf("Result of multiply(1, 4294967295) = %ld\n", m);

	m = multiply(4294967295, 1);
	printf("Result of multiply(4294967295, 1) = %ld\n", m);

	m = multiply(4294967295, 4294967295);
	printf("Result of multiply(4294967295, 4294967295) = %ld\n", m);

    return 0;
}

/* Number of instructions:
 * - Breakpoint at line 25: 12.244
 * - Breakpoint at line 27: 14.738
 * - Breakpoint at line 28: 14.756
 */
