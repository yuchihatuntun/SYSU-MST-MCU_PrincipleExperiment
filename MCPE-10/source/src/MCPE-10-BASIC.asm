CODE    SEGMENT ;       ; 定义代码段开始
        ASSUME CS:CODE  ; 告知汇编器CS寄存器指向CODE段

; 地址定义
IOCON   EQU 08006H      ; 8255控制口地址
IOA     EQU 08000H      ; 8255 PA口地址
IOB     EQU 08002H      ; 8255 PB口地址
IOC     EQU 08004H      ; 8255 PC口地址

; 程序开始
START:
        ; 设置8255工作模式（B口、C口输出，A口输入）
        MOV AL,90H      ; 控制字90H=10010000B
                        ; 1:控制字标志
                        ; 00:A组方式0（基本输入输出）
                        ; 1:A口输入
                        ; 0:C口高4位输出
                        ; 0:B组方式0
                        ; 0:B口输出
                        ; 0:C口低4位输出
        MOV DX,IOCON    ; DX←控制口地址08006H
        OUT DX,AL       ; 将控制字写入控制口，配置8255

START1: 
        ; 读取A口数据
        MOV AL,0        ; AL清零（可省略，IN指令会覆盖）
        MOV DX,IOA      ; DX←A口地址08000H
        IN AL,DX        ; 从A口读取数据到AL寄存器
        
        ; 将数据输出到B口
        MOV DX,IOB      ; DX←B口地址08002H
        OUT DX,AL       ; 将AL中的数据输出到B口
        
        ; 跳转继续执行
        JMP START1      ; 无条件跳转到START1，形成无限循环

CODE    ENDS            ; 代码段结束
        END START       ; 程序结束，入口点为START