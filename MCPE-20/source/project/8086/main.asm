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
TEST_BU:
        MOV DX,IOA
        IN  AL,DX
;        MOV DX,IOA
;        IN  AL,DX
        
test_1:	TEST AL,01H
	JE MOT1            
test_2:	TEST AL,02H
	JE MOT2      
test_3: TEST AL,04H     
        JE MOT3
        JMP TEST_BU
        
MOT1:   MOV CX,08H
        LEA DI,STR1
IOLED1: MOV AL,[DI]
        MOV DX,IOB
        OUT DX,AL
        INC DI
        CALL DELAY
	LOOP IOLED1
        MOV DX,IOA
        IN  AL,DX
        TEST AL,02H
        JE MOT2  ; 为0
        TEST AL,04H
        JE MOT3  ; 为0
	JMP MOT1  
	      
MOT2:   MOV CX,08H
        LEA DI,STR2
IOLED2: MOV AL,[DI]
        MOV DX,IOB
        OUT DX,AL
        INC DI
        CALL DELAY
	LOOP IOLED2
        MOV DX,IOA
        IN  AL,DX
        TEST AL,01H
        JE MOT1  ; 为0
        TEST AL,04H
        JE MOT3  ; 为0
	JMP MOT2      
	       
MOT3:   MOV AL,0F0H
        MOV DX,IOB
        OUT DX,AL  
        JMP TEST_BU  
	        	   	
DELAY:	PUSH CX
	MOV CX,011H
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
STR1    DB 02H,06H,04H,0CH,08H,09H,01H,03H	;控制数据表
STR2    DB 03H,01H,09H,08H,0CH,04H,06H,02H	;控制数据表
DATA    ENDS
        END START
