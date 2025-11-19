CODE    SEGMENT
        ASSUME  CS:CODE, DS:CODE, ES:CODE  ; 段定义

START:  
        ; --- 1. 环境初始化 ---
        MOV     AX, CS
        MOV     DS, AX            ; DS = CS
        MOV     ES, AX            ; ES = CS

        ; --- 2. 实验数据 ---
        MOV     SI, 1000H         
        MOV     CX, 10            
        MOV     AL, 1
INIT_DATA:
        MOV     [SI], AL
        INC     AL
        INC     SI
        LOOP    INIT_DATA
        
        ; ===  3. 通用迁移逻辑    ===
        
        MOV     SI, 1000H         
        MOV     DI, 1002H         ; 【输入】目的首地址
        MOV     CX, 10            

        ; --- 4. 判断逻辑 ---
        CMP     SI, DI            ; 比较源地址(SI) 和 目的地址(DI)
        JAE     USE_FORWARD       ; 若 SI >= DI (源在后或相等)，跳去正向搬运
                                  ; 若 SI < DI  (源在前)，继续执行默认倒序逻辑

USE_BACKWARD:
        ADD     SI, CX
        DEC     SI                ; SI = SI + CX - 1
        ADD     DI, CX
        DEC     DI                ; DI = DI + CX - 1
        
        STD                       ; DF=1 (地址自动递减)
        JMP     DO_MOVE           ; 跳转到公共搬运指令

USE_FORWARD:
        CLD                       ; DF=0 (地址自动递增)

DO_MOVE:
        REP     MOVSB             ; 硬件循环：根据DF标志，自动增或减指针
        JMP     $                 
CODE    ENDS
        END     START