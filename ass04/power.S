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


//multiply:
//    SUB SP, SP, #16         // Adjust stack pointer to make room for 2 items
//    STUR X10, [SP, #8]      // Push register X10 to stack
//    STUR X9, [SP, #0]       // Push register X9 to stack
//    ADD X9, XZR, XZR        // Create variable i and initialize to 0
//    ADD X10, XZR, XZR       // Create variable answer and initialize to 0
//loop:
//    CMP X9, 64              // Compare i with the number 64
//    B.GE endloop            // If i is greater than or equal to 64, branch to endloop
//
//    SUBS XZR, X10, 1		// Substract 1 from argument B and set flags
//    B.NE endif				// Branch to endif if not equal
//    ADD X10, X10, X1		// Add a to answer
//endif:
//	LSL X1, X1, 1			// Shift a 1 left
//	LSR X2, X2, 1			// Shift b 1 right
//    ADD X9, X9, #1          // Increment i
//endloop:
//    ADD X0, X10, XZR        // Move answer to return register
//    LDUR X9, [SP, #0]       // Restore saved register X9
//    LDUR X10, [SP, #8]      // Restore saved register X10
//    ADD SP, SP, #16         // Adjust stack pointer to pop 2 items
//    BR X30                  // Branch and link to return address
//endpower:
//	// Move answer to return register
//	// Restore register
//	// Adjust stack pointer
//	// Branch and link to return address
