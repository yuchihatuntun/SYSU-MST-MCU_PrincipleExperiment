CODE    SEGMENT
        ASSUME  CS:CODE, DS:CODE, ES:CODE  ; 段定义

START:  
        MOV     AX, CS
        MOV     DS, AX            ; DS = CS
        MOV     ES, AX            ; ES = CS

        MOV     SI, 1000H         
        MOV     CX, 10            
        MOV     AL, 1
INIT_DATA:
        MOV     [SI], AL
        INC     AL
        INC     SI
        LOOP    INIT_DATA
        
        
        MOV     SI, 1000H         
        MOV     DI, 1002H         ; 目的首地址
        MOV     CX, 10            

        CMP     SI, DI            ; 比较SI和DI
        JAE     USE_FORWARD       ; CF=0，对应SI >= DI 
                                  ; SI < DI  

USE_BACKWARD:
        ADD     SI, CX
        DEC     SI                ; SI = SI + CX - 1
        ADD     DI, CX
        DEC     DI                ; DI = DI + CX - 1
        
        STD                       ; DF=1 
        JMP     DO_MOVE           

USE_FORWARD:
        CLD                       ; DF=0 

DO_MOVE:
        REP     MOVSB             
        JMP     $                 
CODE    ENDS
        END     START