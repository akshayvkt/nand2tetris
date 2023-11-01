// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Pseudocode:

// sum = 0; i = 1
// while i <= M[R1]:
//  sum = sum + M[R0]
//  i = i + 1
//  M[R2] = sum

// Put your code here.

@R0
M = M

@R1
D = M

@R2
M = 0

@i
M = 1

(LOOP)
    @i
    D = M
    @R1
    D = D - M
    @END
    D; JGT // if M-D>0, then go to END 

    @R0
    D = M
    @R2
    M = M + D // incrementing our value in mult by adding R1 to R0
    @i
    M = M + 1  // i = i + 1
    @LOOP
    0; JMP //Jump back to the beginning of the LOOP

    (END)
        @END
        0; JMP //Infinite loop