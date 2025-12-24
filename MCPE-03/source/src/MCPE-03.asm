CODE    SEGMENT
        ASSUME  CS:CODE          
        CON_A   EQU 25           
        CON_B   EQU 12           

START:  MOV     AX, CON_A       
        MOV     BX, CON_B       
        CMP     AX, BX          
        JNC     MO_T            ; AX ≥ BX（无进位），跳至MO_T
        JE      EQUA            ; AX = BX（相等），跳至EQUA
        JC      LESS            ; AX < BX（有进位），跳至LESS

MO_T:   MOV     CX, 0100H
        JMP     $       
EQUA:   MOV     CX, 0200H  
        JMP     $     
LESS:   MOV     CX, 0300H               
        JMP     $
        
CODE    ENDS                    
        END     START           