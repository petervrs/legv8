	.globl multiply
multiply:
    MOV X12, #1				// Initialize variable i to 1
    MOV X13, XZR       		// Create variable answer and initialize to 0

loop:
    CMP X12, #64             // Compare i with the number 64
    B.HS endloop            // If i is greater than or equal to 64, branch to endloop
	AND X11, X1, #1			// Perform argument b & 1 and store result in X11
    CMP X11, #1				// Compare b & 1 to 1
    B.NE endif				// Branch to endif if not equal
    ADD X13, X13, X0		// Add a to answer

endif:
	LSL X0, X0, 1			// Shift a 1 left
	LSR X1, X1, 1			// Shift b 1 right
    ADD X12, X12, #1          // Increment i
    B loop					// Branch back to start of loop

endloop:
    MOV X0, X13			    // Move answer to return register
    BR X30                  // Branch and link to return address
