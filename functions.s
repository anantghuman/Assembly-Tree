/**************************************************************************
 * C S 429 Assembly Coding Lab
 *
 * functions.s - Template for all functions to be implemented.
 *
 * Copyright (c) 2022, 2023, 2024.
 * Authors: Kavya Rathod, Prithvi Jamadagni, Anoop Rachakonda
 * All rights reserved.
 * May not be used, modified, or copied without permission.
 **************************************************************************/

 /*
 ** Anant Ghuman asg3966 **
 */
    
    .arch armv8-a
	.file	"functions.c"
	.text


    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global hamming_distance
    .type   hamming_distance, %function
hamming_distance:
    // (STUDENT TODO) Code for hamming_distance goes here.
    // Input parameter x is passed in X0; input parameter y is passed in X1.
    // Output value is returned in X0.
    

    ret
    .size   hamming_distance, .-hamming_distance
    // ... and ends with the .size above this line.


	// Every function starts from the .align below this line ...
	.align	2
	.global	transpose
	.type	transpose, %function
transpose:
    // (STUDENT TODO) Code for transpose goes here.
    // Input parameter x is passed in X0.
    // Output value is returned in X0.


    ret
	.size	transpose, .-transpose
	// ... and ends with the .size above this line.


// Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global compare
    .type   compare, %function
compare:
    // (STUDENT TODO) Code for compare goes here.
    // Input parameter a is passed in X0; input parameter b is passed in X1.
    // Output value is returned in X0.

    ret
    .size   compare, .-compare
    // ... and ends with the .size above this line.


	// Every function starts from the .align below this line ...
	.align	2
	.global	change_case
	.type	change_case, %function
change_case:
    // (STUDENT TODO) Code for change_case goes here.
    // Input parameter str is passed in X0; input parameter flag is passed in X1.
    // There is no output value. Parameter str will be mutated.

ret

	.size	change_case, .-change_case
	// ... and ends with the .size above this line.

	// Every function starts from the .align below this line ...
	.align	2
	.global	tree_depth
	.type	tree_depth, %function


tree_depth:
    // (STUDENT TODO) Code for tree_depth goes here.
    // Input parameter root is passed in X0.
    // Output value is returned in X0.

    ret
	.size	tree_depth, .-tree_depth
	// ... and ends with the .size above this line.


    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global hamming_decode
    .type   hamming_decode, %function

hamming_decode:
    // (STUDENT TODO) Code for hamming_decode goes here.
    // Input parameter code is passed in X0; input parameter hamming_codes is passed in X1.
    // Output value is returned in X0.
    
    ret

    .size   hamming_decode, .-hamming_decode
