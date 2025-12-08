DATA    SEGMENT
        TABLE   DW  20                      ; 表长
                DW  -10,-9,-8,-7,-6,-5,-4,-3,-2,-1
                DW  0,1,2,3,4,5,6,7,8,9     
        
        NEGNUM  DW  0       ; -
        POSNUM  DW  0       ; + 
        ZERONUM DW  0       ; 0
DATA    ENDS

CODE    SEGMENT
        ASSUME  CS:CODE, DS:DATA
        
START:

        MOV     AX, DATA
        MOV     DS, AX
        
        ; 初始化计数器
        XOR     BX, BX          ; -
        XOR     DX, DX          ; 0
        XOR     AX, AX          ; +
        
        MOV     CX, TABLE       
        MOV     SI, 2           ; 指向第一个数据（跳过一个字）
        
COUNT_LOOP:
        ; 读取当前数字并分类
        CMP     WORD PTR [TABLE+SI], 0
        JL      IS_NEG          ; Jump if Less SF ≠ OF
        JG      IS_POS          ; Jump if Greater ZF=0 AND SF=OF
        
        ; 前两个都没跳转就是0
        INC     DX              
        JMP     NEXT
        
IS_NEG:
        INC     BX              
        JMP     NEXT

IS_POS:
        INC     AX              

NEXT:
        ADD     SI, 2           ; 移动到下一个字
        LOOP    COUNT_LOOP      
        
        MOV     NEGNUM, BX      
        MOV     ZERONUM, DX     
        MOV     POSNUM, AX      
        
        JMP     $

CODE    ENDS
        END     START