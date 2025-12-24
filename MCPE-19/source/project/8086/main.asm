CODE    SEGMENT 'CODE' 
        ASSUME CS:CODE,SS:STACK,DS:DATA
        
IOCON	EQU 8006H
IOA     EQU 8000H
IOB     EQU 8002H
IOC     EQU 8004H

START:
        MOV AX, DATA
        MOV DS, AX

        MOV AX, STACK
        MOV SS, AX

        MOV AX, TOP
        MOV SP, AX
        
        
        MOV AL,90H
        MOV DX,IOCON
        OUT DX,AL
        NOP
        NOP
TEST_BU: 
        MOV DX,IOA
	IN  AL,DX
        NOP
        
test_1:	TEST AL,01H
	JE MOT1            
test_2:	TEST AL,02H
	JE MOT2      
test_3: TEST AL,04H     
        JE MOT3
        JMP TEST_BU

MOT1: 
        MOV AL,0FEH
        MOV DX,IOB
        OUT DX,AL
        MOV DX,IOA
	IN  AL,DX
	TEST AL,02H
	JE MOT2      
        TEST AL,04H     
        JE MOT3
        JMP MOT1
MOT2:
        MOV AL,0FDH
        MOV DX,IOB
        OUT DX,AL
        MOV DX,IOA
	IN  AL,DX
	TEST AL,01H
	JE MOT1      
        TEST AL,04H     
        JE MOT3
        JMP MOT2
MOT3:
        MOV AL,0FFH
        MOV DX,IOB
        OUT DX,AL
        MOV DX,IOA
	IN  AL,DX
	TEST AL,01H
	JE MOT1      
        TEST AL,02H     
        JE MOT2
        JMP MOT3
 	
DELAY:  PUSH CX
	MOV CX,0FH
DELAY1:	NOP
	NOP
	NOP
	NOP
	LOOP DELAY1
	POP CX
	RET
	
CODE    ENDS
      
STACK   SEGMENT 'STACK'
STA     DB  100 DUP(?)
TOP     EQU LENGTH STA
STACK   ENDS       
DATA    SEGMENT 'DATA'
DATA    ENDS
        END START
