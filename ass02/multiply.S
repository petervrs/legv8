	.globl multiply
multiply:
    SUB SP, SP, #16         // Adjust stack pointer to make room for 2 items
    STUR X10, [SP, #8]      // Push register X10 to stack
    STUR X9, [SP, #0]       // Push register X9 to stack
    MOV X9, XZR       		// Create variable i and initialize to 0
    MOV X10, XZR		    // Create variable answer and initialize to 0

loop:
    CMP X9, X0              // Compare i with argument a
    B.HS endloop            // If i is greater than or equal to argument a, branch to endloop
    ADD X10, X10, X1        // Add argument b to answer
    ADD X9, X9, #1          // Increment i
    B loop					// Branch back to start of loop

endloop:
    MOV X0, X10			    // Move answer to return register
    LDUR X9, [SP, #0]       // Restore saved register X9
    LDUR X10, [SP, #8]      // Restore saved register X10
    ADD SP, SP, #16         // Adjust stack pointer to pop 2 items
    BR X30                  // Branch and link to return address
