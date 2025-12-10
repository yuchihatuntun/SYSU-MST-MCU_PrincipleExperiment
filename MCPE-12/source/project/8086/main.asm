CODE	SEGMENT 
		ASSUME DS:DATA,CS:CODE
;地址定义	
CS8251R  EQU 0F080H  
CS8251D  EQU 0F000H
CS8251C  EQU 0F002H  

TCONTRO   EQU 0A006H
TCON0     EQU 0A000H
;开始
START:   
		;data-->ds
		MOV AX,DATA
		MOV DS,AX
		;8253设置通道0，写低8位，方式3，二进制
		MOV DX,TCONTRO 
		MOV AL,16H 
		OUT DX,AL
		;通道0，初值52，输出=1MHZ/52
		MOV DX,TCON0
		MOV AX,52   
		OUT DX,AL

		MOV DX, CS8251R
		IN AL,DX
		NOP
		MOV DX, CS8251R
		IN AL,DX
		NOP
		
		;设置模式寄存器：1个停止位，无校验位，8位数据位，波特率因子1  （异步模式）
		MOV DX, CS8251C
		MOV AL, 01001101b  
		OUT DX, AL
		;设置控制寄存器：使能3出错标志位，允许接收，允许发送
		MOV AL, 00010101b   
		OUT DX, AL


START4:
		;发送字节数存入CX中，首地址存入di中
		MOV CX,22
		LEA DI,STR1
		;发送一个字节数据
SEND:      
WaitTXD:
		;判断发送标志位（0时发送完成）
		MOV DX,CS8251C
		IN AL, DX
		TEST AL, 1           
		JZ WaitTXD
		;发送一个字节数据
		MOV AL, [DI]      
		MOV DX, CS8251D
		OUT DX, AL  
		;小延时
		PUSH CX
		MOV CX,2FH
		LOOP $
		POP CX
		;指向下个字节。
		INC DI
		;完成一个字节发送
		LOOP SEND
		;完成所有字节发送
		JMP START4


Receive:         
       MOV DX, CS8251C
WaitRXD:
       IN AL, DX
       TEST AL, 2          
       JE WaitRXD
       MOV DX, CS8251D
       IN AL, DX         
       MOV BH, AL

       JMP START
CODE      ENDS
DATA    SEGMENT
STR1 db 'Fengbiao Educational!'
str2 db 0dh
DATA    ENDS
          END START

