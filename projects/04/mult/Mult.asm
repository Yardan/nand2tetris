// Program: Mult.asm
// Computes RAM[2] = RAM[1] * RAM[0]
// Usage: put a number (a) in RAM[0] and a number (n) in RAM[1]
// pseudeo code:
//   a = R0
//   n = R1
//   sum = 0
//   i = 1
// LOOP
//   if i > n goto STOP
//   sum = sum + a
//   i = i + 1
//   goto LOOP
//
// STOP
//   R2 = sum

    @R0
    D=M
    @a
    M=D // a = R0

    @R1
    D=M
    @n
    M=D // n = R1

    @R2
    M=0 // RAM[2]=0

    @sum
    M=0 // sum = 0

    @i
    M=1 // i = 1

(LOOP)
    @i
    D=M
    @n
    D=D-M
    @STOP
    D;JGT // if i > n goto STOP

    @sum
    D=M
    @a
    D=D+M
    @sum
    M=D  // sum = sum + a

    @i
    M=M+1 // i = i + 1
    
    @LOOP
    0;JMP

(STOP)
    @sum
    D=M
    @R2
    M=D // RAM[2] = sum

(END)
    @END
    0;JMP
