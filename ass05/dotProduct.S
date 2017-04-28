	.globl dotProduct
dotproduct:
	STUR X30, [SP, #24]		// Push return address to stack
	STUR X0, [SP, #16]		// Push first function argument (a) to stack
	STUR X1, [SP, #8]		// Push second function argument (b) to stack
	STUR X2, [SP, #0]		// Push third function argument (n) to stack
	MOV	X9, XZR				// Initialize loop counter i to 0
	MOV X10, XZR			// Initialize result value to 0

loop:
	LDUR X10, [SP, #0]		// Fetch array length n from stack
	CMP X9, X1				// Compare i and exponent
	B.HS endloop			// If i is greater than or equal to the exponent, branch to endloop

	// Calculate first address
	MOV X0, X9				// Move i to first function argument
	ADD X1, XZR, #8			// Initialize second argument register to 8
	BL multiply				// Branch and link to multiply function
	LDUR X11, [SP, #16]		// Load address of first element of array a into X11
	ADD X11, X11, X0		// Add calculated offset to X11

	// Calculate second address
	MOV X0, X9				// Move i to first function argument
	ADD X1, XZR, #8			// Initialize second argument register to 8
	BL multiply				// Branch and link to multiply function
	LDUR X12, [SP, #8]		// Load address of first element of array b into X12s
	ADD X12, X12, X0		// Add calculated offset to X12

	LDUR X0, [X11, #0]		// Load current element of array a into first argument register
	LDUR X1, [X12, #0]		// Load current element of array b into second argument register
	BL multiply				// Branch and link to multiply function
	ADD X10, X10, X0		// Add returned value to result

	ADD	X9, X9, #1			// Increment i
	B loop					// Branch back to start of loop

endloop:
	MOV X0, X10				// Move result of calculation to return register
	LDUR X30, [SP, #24]		// Fetch return address from stack and store in return register
	BR X30					// Branch and link to return address
