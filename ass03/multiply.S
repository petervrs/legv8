	.globl multiply
multiply:
    SUB SP, SP, #16         // Adjust stack pointer to make room for 2 items
    STUR X10, [SP, #8]      // Push register X10 to stack
    STUR X9, [SP, #0]       // Push register X9 to stack
    ADD X9, XZR, XZR        // Create variable i and initialize to 0
    ADD X10, XZR, XZR       // Create variable answer and initialize to 0
loop:
    CMP X9, 64              // Compare i with the number 64
    B.GE endloop            // If i is greater than or equal to 64, branch to endloop

    SUBS XZR, X10, 1		// Substract 1 from argument B and set flags
    B.NE endif				// Branch to endif if not equal
    ADD X10, X10, X0		// Add a to answer

endif:
	LSL X0, X0, 1			// Shift a 1 left
	LSR X1, X1, 1			// Shift b 1 right

    ADD X9, X9, #1          // Increment i
endloop:
    ADD X0, X10, XZR        // Move answer to return register
    LDUR X9, [SP, #0]       // Restore saved register X9
    LDUR X10, [SP, #8]      // Restore saved register X10
    ADD SP, SP, #16         // Adjust stack pointer to pop 2 items
    BR X30                  // Branch and link to return address
