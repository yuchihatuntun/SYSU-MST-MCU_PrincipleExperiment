CODE    SEGMENT
        ASSUME  CS:CODE, DS:CODE, ES:CODE  

START:  
        MOV     AX, CS
        MOV     DS, AX            
        MOV     ES, AX            

        
        MOV     SI, 1000H         ; 字符串1首地址
        MOV     CX, 5             ; 
        MOV     AL, 'A'           ; 第一个字符'A'

INIT_STR1:                        
        MOV     [SI], AL          
        INC     AL                
        INC     SI                
        LOOP    INIT_STR1         


        MOV     DI, 2000H         ; 字符串2首地址
        MOV     CX, 5             
        MOV     AL, 'B'           ; 第一个字符'B'

INIT_STR2:                        
        MOV     [DI], AL          
        INC     AL                
        INC     DI                
        LOOP    INIT_STR2         

        MOV     SI, 1000H         
        MOV     DI, 2000H         
        MOV     CX, 5             

        CLD                       ; DF=0，在串操作时自动递增
        
        ; - REPE (Repeat While Equal)
        ; - CMPSB (Compare Byte Strings)
        REPE    CMPSB             


        JZ      MATCH_ADDR        ; ZF=1，跳转到MATCH_ADDR
        JNZ     NOMATCH_ADDR      ; ZF=0，跳转到NOMATCH_ADDR


MATCH_ADDR:                       
        MOV     AX, 0000H         
        JMP     STOP_PROG         

NOMATCH_ADDR:                     
        MOV     AX, 0FFFFH        
        JMP     STOP_PROG        

STOP_PROG:                        
        JMP     $                 

CODE    ENDS
        END     START             