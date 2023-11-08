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


@R1
M = 8192


@i
M = 1


(START)
    @i
    D = M 
    @Screen
    A = A + D
    M = 0


    @Keyboard
    D = M
    @LOOP
    D; JGT //if the keyboard value is >0, then go back to the loop

    @i 
    M = M + 1

    @R1
    @START
    D; JMP //if the keyboard value is zero, continue through the start loop



(LOOP)
    @Keyboard
    D = M
    @START   // if Keyboard == 0, then jump back to Start, which loops through
    D; JMP   // and assigns each element's memory to zero value
    @i 
    D = M
    M = M + 1
    @Screen
    A = A + D
    M = -1

    @R1
    D = M 
    @i
    D = M - D 
    @END
    D; JMP 


(END)
    @END
    0; JMP