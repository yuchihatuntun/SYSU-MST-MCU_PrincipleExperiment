CODE    SEGMENT
        ASSUME  CS:CODE          
        CON_A   EQU 25           
        CON_B   EQU 12           

START:  MOV     AX, 0           
        MOV     CX, 5           
INC_AX: NOP                     
        INC     AX              
        LOOP    INC_AX          ; LOOP»á×Ô¶¯µÝ¼õCX
        JMP     $              
CODE    ENDS                    
        END     START           