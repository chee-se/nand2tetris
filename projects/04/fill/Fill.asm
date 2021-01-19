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

// initialize SCREEN_END
@SCREEN
D=A
@8192
D=D+A
@SCREEN_END
M=D

(LOOP)
// initialize
@SCREEN
D=A
@render
M=D
@color
M=0

@KBD
D=M

@DISPLAY
D;JEQ // render white

@color
M=!M // render black

// render from here
(DISPLAY)

// render color
@color
D=M
@render
A=M
M=D

// move to next word
@render
MD=M+1

@SCREEN_END
D=M-D

@DISPLAY
D;JGT

@LOOP
0;JMP
