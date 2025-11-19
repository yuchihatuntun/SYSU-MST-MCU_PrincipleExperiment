CODE    SEGMENT
        ASSUME  CS:CODE          ; 关联代码段寄存器
        CON_A   EQU 25           ; 定义常量CON_A=25
        CON_B   EQU 12           ; 定义常量CON_B=12

START:  MOV     AX, CON_A       ; 将CON_A的值存入AX（AX=25）
        MOV     BX, CON_B       ; 将CON_B的值存入BX（BX=12）
        CMP     AX, BX          ; 比较AX和BX的值（25 vs 12）
        JNC     MO_T            ; 若AX ≥ BX（无进位），跳至MO_T
        JE      EQUA            ; 若AX = BX（相等），跳至EQUA
        JC      LESS            ; 若AX < BX（有进位），跳至LESS

MO_T:   JMP     $               ; AX ≥ BX时执行，无限循环
EQUA:   JMP     $               ; AX = BX时执行，无限循环
LESS:   JMP     $               ; AX < BX时执行，无限循环

CODE    ENDS                    ; 代码段结束
        END     START           ; 程序入口点为START