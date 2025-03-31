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


    EOR x0, x0, x1

    MOVK x3, #0x5555            
    MOVK x3, #0x5555, LSL #16    
    MOVK x3, #0x5555, LSL #32   
    MOVK x3, #0x5555, LSL #48   
    ANDS  x1, x0, x3             
    LSR  x2, x0, #1             
    ANDS  x2, x2, x3            
    ADDS  x0, x1, x2          

    MOVK x3, #0x3333
    MOVK x3, #0x3333, LSL #16
    MOVK x3, #0x3333, LSL #32
    MOVK x3, #0x3333, LSL #48
    ANDS  x1, x0, x3
    LSR  x2, x0, #2
    ANDS  x2, x2, x3
    ADDS  x0, x1, x2

    MOVK x3, #0x0F0F
    MOVK x3, #0x0F0F, LSL #16
    MOVK x3, #0x0F0F, LSL #32
    MOVK x3, #0x0F0F, LSL #48
    ANDS  x1, x0, x3
    LSR  x2, x0, #4
    ANDS  x2, x2, x3
    ADDS  x0, x1, x2

    MOVK x3, #0x00FF
    MOVK x3, #0x00FF, LSL #16
    MOVK x3, #0x00FF, LSL #32
    MOVK x3, #0x00FF, LSL #48
    ANDS  x1, x0, x3
    LSR  x2, x0, #8
    ANDS  x2, x2, x3
    ADDS  x0, x1, x2

    
    MOVK x3, #0xFFFF         
    MOVK x3, #0x0000, LSL #16 
    MOVK x3, #0xFFFF, LSL #32   
    MOVK x3, #0x0000, LSL #48   
    ANDS  x1, x0, x3
    LSR  x2, x0, #16
    ANDS  x2, x2, x3
    ADDS  x0, x1, x2

    
    MOVK x3, #0x0000, LSL #48 
    MOVK x3, #0x0000, LSL #32    
    MOVK x3, #0xFFFF, LSL #16   
    MOVK x3, #0xFFFF, LSL #0
    ANDS  x1, x0, x3
    LSR  x2, x0, #32
    ANDS  x2, x2, x3
    ADDS  x0, x1, x2
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
    // x = (x & 0x0000FF00) << 8 | (x >> 8) & 0x0000FF00 | x & 0xFF0000FF;
    // x = (x & 0x00F000F0) << 4 | (x >> 4) & 0x00F000F0 | x & 0xF00FF00F;
    // x = (x & 0x0C0C0C0C) << 2 | (x >> 2) & 0x0C0C0C0C | x & 0xC3C3C3C3;
    // x = (x & 0x22222222) << 1 | (x >> 1) & 0x22222222 | x & 0x99999999;
    // return x
    
    //00000000FFFF0000
    MOVZ x4, #0x0000
    MOVK x4, #0xFFFF, LSL #16
    MOVK x4, #0x0000, LSL #32
    MOVK x4, #0x0000, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #16
    LSR x2, x0, #16
    ANDS x2, x2, x4

    MOVZ x4, #0xFFFF
    MOVK x4, #0x0000, LSL #16
    MOVK x4, #0x0000, LSL #32
    MOVK x4, #0xFFFF, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0xFF00
    MOVK x4, #0x0000, LSL #16
    MOVK x4, #0xFF00, LSL #32
    MOVK x4, #0x0000, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #8
    LSR x2, x0, #8
    ANDS x2, x2, x4

    MOVZ x4, #0x00FF
    MOVK x4, #0xFF00, LSL #16
    MOVK x4, #0x00FF, LSL #32
    MOVK x4, #0xFF00, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x00F0
    MOVK x4, #0x00F0, LSL #16
    MOVK x4, #0x00F0, LSL #32
    MOVK x4, #0x00F0, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #4
    LSR x2, x0, #4
    ANDS x2, x2, x4

    MOVZ x4, #0xF00F
    MOVK x4, #0xF00F, LSL #16
    MOVK x4, #0xF00F, LSL #32
    MOVK x4, #0xF00F, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x0C0C
    MOVK x4, #0x0C0C, LSL #16
    MOVK x4, #0x0C0C, LSL #32
    MOVK x4, #0x0C0C, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #2
    LSR x2, x0, #2
    ANDS x2, x2, x4

    MOVZ x4, #0xC3C3
    MOVK x4, #0xC3C3, LSL #16
    MOVK x4, #0xC3C3, LSL #32
    MOVK x4, #0xC3C3, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x2222
    MOVK x4, #0x2222, LSL #16
    MOVK x4, #0x2222, LSL #32
    MOVK x4, #0x2222, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #1
    LSR x2, x0, #1
    ANDS x2, x2, x4

    MOVZ x4, #0x9999
    MOVK x4, #0x9999, LSL #16
    MOVK x4, #0x9999, LSL #32
    MOVK x4, #0x9999, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3

    MOVZ x4, #0x0000
    MOVK x4, #0xFFFF, LSL #16
    MOVK x4, #0x0000, LSL #32
    MOVK x4, #0x0000, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #16
    LSR x2, x0, #16
    ANDS x2, x2, x4

    MOVZ x4, #0xFFFF
    MOVK x4, #0x0000, LSL #16
    MOVK x4, #0x0000, LSL #32
    MOVK x4, #0xFFFF, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0xFF00
    MOVK x4, #0x0000, LSL #16
    MOVK x4, #0xFF00, LSL #32
    MOVK x4, #0x0000, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #8
    LSR x2, x0, #8
    ANDS x2, x2, x4

    MOVZ x4, #0x00FF
    MOVK x4, #0xFF00, LSL #16
    MOVK x4, #0x00FF, LSL #32
    MOVK x4, #0xFF00, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x00F0
    MOVK x4, #0x00F0, LSL #16
    MOVK x4, #0x00F0, LSL #32
    MOVK x4, #0x00F0, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #4
    LSR x2, x0, #4
    ANDS x2, x2, x4

    MOVZ x4, #0xF00F
    MOVK x4, #0xF00F, LSL #16
    MOVK x4, #0xF00F, LSL #32
    MOVK x4, #0xF00F, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x0C0C
    MOVK x4, #0x0C0C, LSL #16
    MOVK x4, #0x0C0C, LSL #32
    MOVK x4, #0x0C0C, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #2
    LSR x2, x0, #2
    ANDS x2, x2, x4

    MOVZ x4, #0xC3C3
    MOVK x4, #0xC3C3, LSL #16
    MOVK x4, #0xC3C3, LSL #32
    MOVK x4, #0xC3C3, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x2222
    MOVK x4, #0x2222, LSL #16
    MOVK x4, #0x2222, LSL #32
    MOVK x4, #0x2222, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #1
    LSR x2, x0, #1
    ANDS x2, x2, x4

    MOVZ x4, #0x9999
    MOVK x4, #0x9999, LSL #16
    MOVK x4, #0x9999, LSL #32
    MOVK x4, #0x9999, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3

    MOVZ x4, #0x0000
    MOVK x4, #0xFFFF, LSL #16
    MOVK x4, #0x0000, LSL #32
    MOVK x4, #0x0000, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #16
    LSR x2, x0, #16
    ANDS x2, x2, x4

    MOVZ x4, #0xFFFF
    MOVK x4, #0x0000, LSL #16
    MOVK x4, #0x0000, LSL #32
    MOVK x4, #0xFFFF, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0xFF00
    MOVK x4, #0x0000, LSL #16
    MOVK x4, #0xFF00, LSL #32
    MOVK x4, #0x0000, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #8
    LSR x2, x0, #8
    ANDS x2, x2, x4

    MOVZ x4, #0x00FF
    MOVK x4, #0xFF00, LSL #16
    MOVK x4, #0x00FF, LSL #32
    MOVK x4, #0xFF00, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x00F0
    MOVK x4, #0x00F0, LSL #16
    MOVK x4, #0x00F0, LSL #32
    MOVK x4, #0x00F0, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #4
    LSR x2, x0, #4
    ANDS x2, x2, x4

    MOVZ x4, #0xF00F
    MOVK x4, #0xF00F, LSL #16
    MOVK x4, #0xF00F, LSL #32
    MOVK x4, #0xF00F, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3



    MOVZ x4, #0x0C0C
    MOVK x4, #0x0C0C, LSL #16
    MOVK x4, #0x0C0C, LSL #32
    MOVK x4, #0x0C0C, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #2
    LSR x2, x0, #2
    ANDS x2, x2, x4

    MOVZ x4, #0xC3C3
    MOVK x4, #0xC3C3, LSL #16
    MOVK x4, #0xC3C3, LSL #32
    MOVK x4, #0xC3C3, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3

    MOVZ x4, #0x2222
    MOVK x4, #0x2222, LSL #16
    MOVK x4, #0x2222, LSL #32
    MOVK x4, #0x2222, LSL #48

    ANDS x1, x0, x4
    LSL x1, x1, #1
    LSR x2, x0, #1
    ANDS x2, x2, x4

    MOVZ x4, #0x9999
    MOVK x4, #0x9999, LSL #16
    MOVK x4, #0x9999, LSL #32
    MOVK x4, #0x9999, LSL #48

    ANDS x3, x0, x4
    ORR x0, x1, x2
    ORR x0, x0, x3

    

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

    LDUR x2, [x0, #0]
    LDUR x3, [x1, #0]
    CMP x2, x3
    B.NE different

    LDUR x2, [x0, #8]
    LDUR x3, [x1, #8]
    // get first three bytes
    MOVZ x4, #0xFFFF
    MOVK x4, #0xFF00, LSL #16
    ANDS x2, x2, x4
    ANDS x3, x3, x4
    CMP x2, x3
    B.NE different

    LDUR x2, [x0, #16]
    LDUR x3, [x1, #16]
    CMP x2, x3
    B.NE different

    //get first byte
    LDUR x2, [x0, #24]
    LDUR x3, [x1, #24]
    MOVZ x4, #0xFF
    ANDS x2, x2, x4
    ANDS x3, x3, x4
    CMP x2, x3
    B.NE different

    LDUR x2, [x0, #32]
    LDUR x3, [x1, #32]
    CMP x2, x3
    B.NE different

    LDUR x2, [x0, #40]
    LDUR x3, [x1, #40]
    MOVZ x4, #0xFF
    ANDS x2, x2, x4
    ANDS x3, x3, x4
    CMP x2, x3
    B.NE different

    MOVZ x0, #0
    ret

different:
    MOVZ x0, #1
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
    LDUR x2, [x0] 
    MOVZ x3, 0xFF
    ANDS x2, x2, x3        
    CMP x2, #0        
    B.EQ exit              
    MOVZ x7, #1
    MOVZ x6, #32
    CMP x1, #0              
    B.GT to_uppercase      
    B.EQ to_lowercase      

to_lowercase:
    CMP x2, 'A'             
    B.LT next_byte          
    CMP x2, 'Z'            
    B.GT next_byte         
    ADDS x2, x2, x6       
    B store_byte

to_uppercase:
    CMP x2, 'a'         
    B.LT next_byte          
    CMP x2, 'z'            
    B.GT next_byte  
    SUBS x2, x2, x6   
    B store_byte

store_byte:
    LDUR x4, [x0]   
    MOVZ x5,#0xFF00
    MOVK x5, #0xFFFF, LSL #16  
    MOVK x5, #0xFFFF, LSL #32
    MOVK x5, #0xFFFF, LSL #48
    ANDS x4, x4, x5  
    ORR x4, x4, x2
    STUR x4, [x0]          

next_byte:
    ADDS x0, x0, x7       
    B change_case          

exit:
    ret                     // Return from the function

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
    CMP x0, #0
    B.EQ root_null

    MOVZ x6, #1

    SUB sp, sp, #32
    STUR x29, [sp, #0]     
    STUR x30, [sp, #8]   
    STUR x19, [sp, #16] 
    STUR x20, [sp, #24]   
    ORR x20, x0, xzr

    LDUR x0, [x0, #0]
    BL tree_depth         
    ORR x19, x0, xzr      

    LDUR x0, [x20, #8]
    BL tree_depth         
    ADDS x1, x0, x6     

    CMP x19, x0            
    B.LE right_bigger
    ADDS x0, x19, x6
    B done

right_bigger:
    ORR x0, x1, xzr     

done:
    LDUR x19, [sp, #16]
    LDUR x20, [sp, #24]
    LDUR x29, [sp, #0]
    LDUR x30, [sp, #8]
    ADD sp, sp, #32
    ret

root_null:
    MOVZ     x0, #0
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
    SUB sp, sp, #64
    STUR x29, [sp, #0]
    STUR x30, [sp, #8]
    STUR x19, [sp, #16]
    STUR x20, [sp, #24]
    STUR x21, [sp, #32]
    STUR x22, [sp, #40]
    STUR x23, [sp, #48]
    STUR x24, [sp, #56]

    MOVZ x6, #0xFF
    ANDS x23, x0, x6
    ORR x22, x1, xzr
    MOVZ x19, #0

    MOVZ x21, #0xFF
    MOVZ x20, #0xFFFF
    MOVZ x24, #1

loop:
    CMP x19, #16
    B.EQ epilogue

    ADDS x7, x22, x19
    LDUR x7, [x7]
    ANDS x7, x7, x6

    ORR x0, x23, xzr
    ORR x1, x7, xzr
    BL hamming_distance

    CMP x0, x20
    B.GE next
    ORR x21, x19, xzr
    ORR x20, x0, xzr

next:
    ADDS x19, x19, x24
    B loop

epilogue:
    ANDS x0, x21, x6
    LDUR x19, [sp, #16]
    LDUR x20, [sp, #24]
    LDUR x21, [sp, #32]
    LDUR x22, [sp, #40]
    LDUR x23, [sp, #48]
    LDUR x24, [sp, #56]
    LDUR x29, [sp, #0]
    LDUR x30, [sp, #8]
    ADD sp, sp, #64
    ret

    .size   hamming_decode, .-hamming_decode
