// 128-bit addition
// add two 128-bit numbers
// 0x0000000000000003ffffffffffffffff + 
// 0x00000000000000050000000000000001 =
// 0x00000000000000090000000000000000
// Upper: (0x0000000000000008 + 1 from Carry) Lower: (0000000000000000 + Carry Flag)
// Save into X0

// entry point
.global _start
.align 2	// Make sure everything is aligned properly

// start
_start: 
// Load reg with first 64-bit dword of the input
        mov  X2, #0x0000000000000003
        mov  X3, #0xffffffffffffffff
// Load reg with second 64-bit dword of the input
        mov  X4, #0x0000000000000005
        mov  X5, #0x0000000000000001
// Add
        adds X1, X3, X5 // lower order bits (will cause a carry if over 2^64)
        adc  X0, X2, X4 // upper order bits; will add 1 if cflag is set
// Params to exit
	    mov     X16, #1		// System call number 1 terminates this program
	    svc     #0x80		// Call kernel to terminate the program
                                        // Will return value in X0; bash: echo $? to see value
