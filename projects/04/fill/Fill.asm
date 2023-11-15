// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// we have 256 X 512 pixels, each word is 16 pixels, meaning we have 32 words in each row
// 32x256 words is 8192 words in total. The positions 16384 to 24576 are reserved for the display memory map
// The position 24576 is reserved for the keyboard memory map - this contains 16 bits as well.

// For loop:
// There are 8192 screen memory map positions. Start with the first row position, load -1 value to it. Then iterate over the entire row by increasing Screen value by 1
// all the way until the screen value is 8191. Then end the loop


// Check the input in the keyboard memory map aka RAM[25476].
// If the input is anything but 0, then trigger the loop.

// i = 0,
// while i<8192:
//     SCREEN[i] = -1;
//     i = i + 1 

// if M[keyboard] != 0:
// M[SCREEN] = -1 for SCREEN in range(8192)
// else:
// M[SCREEN] = 0 for SCREEN in range(8192)

@i
M = 0


(LOOP)
    @KBD 
    D = M 
    @ONES
    D; JGT
    @ZEROS
    D; JEQ

(ONES)
    @i
    D = M
    @8192
    D = A - D
    @END
    D; JEQ
    @SCREEN 
    A = A + D
    M = -1
    @i
    M = M + 1
    @LOOP
    0; JMP

(ZEROS)
    @i
    D = M
    @8192
    D = D - A
    @END
    D; JEQ
    @SCREEN 
    A = A + D
    M = 0
    @i
    M = M + 1
    @LOOP
    0; JMP

(END)
    @END
    0; JMP