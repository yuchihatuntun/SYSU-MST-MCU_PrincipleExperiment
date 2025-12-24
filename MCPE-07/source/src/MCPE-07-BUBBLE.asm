CODE    SEGMENT
        ASSUME  CS:CODE
        
START:
        MOV     AX, CS
        MOV     DS, AX
        
        
        MOV     BYTE PTR [0200H], 25
        MOV     BYTE PTR [0201H], 46
        MOV     BYTE PTR [0202H], 3
        MOV     BYTE PTR [0203H], 75
        MOV     BYTE PTR [0204H], 5
        MOV     BYTE PTR [0205H], 30
        
        ; 调用子程序
        CALL    BUBBLE_SORT
        
        JMP     $

BUBBLE_SORT PROC NEAR
        MOV     CX, 6                   
        CMP     CX, 1                   ; 如果长度<=1
        JBE     SORT_DONE
        
        DEC     CX                      ; 外层循环次数 = 长度-1
        
OUTER_LOOP:
        MOV     BX, 0                   
        MOV     SI, 0                   
        
INNER_LOOP:
        ; 检查 SI+1 是否越界
        MOV     AX, SI
        INC     AX
        CMP     AX, 6                   ; 比较索引是否超出数组边界
        JAE     END_INNER_LOOP          ; 如果SI+1 >= 数组长度，结束内层循环
        
        ; 相邻元素比较
        MOV     AL, [0200H + SI]        ; AL = 当前
        MOV     AH, [0200H + SI + 1]    ; AH = 下一个
        
        CMP     AL, AH
        JBE     NO_SWAP                 ; AL <= AH，不交换
        
        ; 交换
        XCHG    AL, AH
        MOV     [0200H + SI], AL        ; 存回当前元素
        MOV     [0200H + SI + 1], AH    ; 存回下一个元素
        MOV     BX, 1                   ; 设置交换标志
        
NO_SWAP:
        INC     SI                      ; 移动到下一对元素
        JMP     INNER_LOOP
        
END_INNER_LOOP:
        CMP     BX, 0
        JE      SORT_DONE               ; 整个内循环没发生交换，排序完成
        
        LOOP    OUTER_LOOP              ; 继续下一轮排序
        
SORT_DONE:
        RET
BUBBLE_SORT ENDP

CODE    ENDS
        END     START