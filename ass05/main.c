/* main.c simple program to test assembler program */

#include <stdio.h>
#include <cstddef>

extern long long int dotProduct (unsigned int a[], unsigned int b[], unsigned int n);

int main(void)
{
	unsigned int a[] = {1, 2, 3, 4, 5};
	unsigned int b[] = {10 , 11, 12, 13, 14};

	if (dotProduct (a, b, 5) == 190) {
		printf ("OK\n");
	} else {
		printf (" Error \n");
	}
}

/* Number of instructions:
 * - Breakpoint at line 10: 420
 * - Breakpoint at line 11: 3357
 */
