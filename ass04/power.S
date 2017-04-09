	.globl power
power:
	STUR X30, [SP, #16]		// Push return address to stack
	STUR X0, [SP, #8]		// Push first function argument (base) to stack
	STUR X1, [SP, #0]		// Push second function argument (exponent) to stack
	MOV	X9, XZR				// Initialize loop counter i to 0
	MOV X10, #1				// Initialize multiply value to 1

loop:
	LDUR X1, [SP, #0]		// Fetch exponent from stack
	CMP X9, X1				// Compare i and exponent
	B.HS endloop			// If i is greater than or equal to the exponent, branch to endloop
	LDUR X0, [SP, #8]		// Fetch base from stack and store in first argument register
	MOV X1, X10				// Move multiply value to second argument register
	BL multiply				// Branch and link to the multiply function
	MOV	X10, X0				// Move return value to first argument register
	ADD	X9, X9, #1			// Increment i
	B loop					// Branch back to start of loop

endloop:
	MOV X0, X10				// Move result of calculation to result register
	LDUR X30, [SP, #16]		// Fetch return address from stack and store in return register
	BR X30					// Branch and link to return address
