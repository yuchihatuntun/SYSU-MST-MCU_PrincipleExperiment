CODE SEGMENT
ASSUME CS:CODE
START:
    MOV  AX, CS           
    MOV  DS, AX
    
    MOV  DX, 0000H        
    MOV  AX, 65535        ; AX=65535 (0FFFFH)
    
    ; 万位
    MOV  BX, 10000        
    DIV  BX               
    MOV  [0200H], AL      
    
    ; 千位
    MOV  AX, DX           
    MOV  DX, 0000H        
    MOV  BX, 1000         
    DIV  BX               
    MOV  [0201H], AL      
    
    ; 百位
    MOV  AX, DX           
    MOV  DX, 0000H        
    MOV  BX, 100          
    DIV  BX              
    MOV  [0202H], AL      
    
    ; 十位
    MOV  AX, DX           
    MOV  DX, 0000H        
    MOV  BX, 10           
    DIV  BX               
    MOV  [0203H], AL      
    
    ; 个位
    MOV  [0204H], DL      
    
    JMP  $                
CODE ENDS
END START