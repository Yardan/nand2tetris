// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.
@8191
D=A
@screen_end
M=D         // screen_end=8191

(LOOP)
    @i
    M=0     // i = 0

    @pixel
    M=0     // pixel = 0

    @KBD
    D=M
    @SCREEN_LOOP
    D;JEQ   // if RAM[KBD]==0 goto SCREEN_LOOP

    @pixel
    M=-1     // pixel = -1


(SCREEN_LOOP)
    @screen_end
    D=M
    @i
    D=D-M
    @END
    D;JLT   // if i >= screen_end goto END

    @SCREEN
    D=A
    @i
    D=D+M
    @tmp
    M=D     // tmp = SCREEN + i

    @pixel
    D=M
    @tmp
    A=M
    M=D     // RAM[tmp] = pixel

    @i
    M=M+1   // i = i + 1
    
    @SCREEN_LOOP
    0;JMP

(END)
    @LOOP
    0;JMP
