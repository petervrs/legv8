	.globl multiply
multiply:
    MOV X9, #1				// Initialize variable i to 1
    MOV X10, XZR       		// Create variable answer and initialize to 0

loop:
    CMP X9, #64             // Compare i with the number 64
    B.HS endloop            // If i is greater than or equal to 64, branch to endloop
	AND X11, X1, #1			// Perform argument b & 1 and store result in X11
    CMP X11, #1				// Compare b & 1 to 1
    B.NE endif				// Branch to endif if not equal
    ADD X10, X10, X0		// Add a to answer

endif:
	LSL X0, X0, 1			// Shift a 1 left
	LSR X1, X1, 1			// Shift b 1 right
    ADD X9, X9, #1          // Increment i
    B loop					// Branch back to start of loop

endloop:
    MOV X0, X10			    // Move answer to return register
    BR X30                  // Branch and link to return address
