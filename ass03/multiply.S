	.globl multiply
multiply:
    SUB SP, SP, #24         // Adjust stack pointer to make room for 3 items
    STUR X11, [SP, #16]		// Push register X11 to stack
    STUR X10, [SP, #8]      // Push register X10 to stack
    STUR X9, [SP, #0]       // Push register X9 to stack
    ADD X9, XZR, XZR		// Create variable i and initialize to 0
    //ADD X9, X9, #1			// Initialize variable i to 1
    ADD X10, XZR, XZR       // Create variable answer and initialize to 0
loop:
    CMP X9, #64             // Compare i with the number 64
    B.GE endloop            // If i is greater than or equal to 64, branch to endloop


	AND X11, X1, #1			// Perform argument b & 1 and store result in C	X11
    SUBS XZR, X11, 1		// Substract 1 from b & 1 and set flags
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
    LDUR X11, [SP, #16]		// Restore saved register X11
    ADD SP, SP, #24         // Adjust stack pointer to pop 3 items
    BR X30                  // Branch and link to return address
