; Horner法则: ((((万位 × 10) + 千位) × 10 + 百位) × 10 + 十位) × 10 + 个位
CODE SEGMENT
ASSUME CS:CODE
START:
    MOV  AX, CS         
    MOV  DS, AX

    ; === 测试用例选择区 ===

    ; 65535 (默认)
    ;MOV  BYTE PTR [0200H], 06H
    ;MOV  BYTE PTR [0201H], 05H
    ;MOV  BYTE PTR [0202H], 05H
    ;MOV  BYTE PTR [0203H], 03H
    ;MOV  BYTE PTR [0204H], 05H
    
    ; 12345
    MOV  BYTE PTR [0200H], 01H
    MOV  BYTE PTR [0201H], 02H
    MOV  BYTE PTR [0202H], 03H
    MOV  BYTE PTR [0203H], 04H
    MOV  BYTE PTR [0204H], 05H
    
    ; 0
    ; MOV  BYTE PTR [0200H], 00H
    ; MOV  BYTE PTR [0201H], 00H
    ; MOV  BYTE PTR [0202H], 00H
    ; MOV  BYTE PTR [0203H], 00H
    ; MOV  BYTE PTR [0204H], 00H
    
    ; 10000
    ; MOV  BYTE PTR [0200H], 01H
    ; MOV  BYTE PTR [0201H], 00H
    ; MOV  BYTE PTR [0202H], 00H
    ; MOV  BYTE PTR [0203H], 00H
    ; MOV  BYTE PTR [0204H], 00H
    
    MOV  BX, 10         ; 乘数10（用于迭代计算）
    XOR  AX, AX         ; AX=0（初始化结果）
    
    ; --- 万位处理 (0200H) ---
    MOV  DL, [0200H]    ; 读取万位BCD
    XOR  DH, DH         ; 清除DH
    ADD  AX, DX         ; AX = 万位值
    MUL  BX             ; AX = 万位 × 10
    
    ; --- 千位处理 (0201H) ---
    MOV  DL, [0201H]    ; 读取千位BCD
    XOR  DH, DH
    ADD  AX, DX         ; AX = (万位×10) + 千位
    MUL  BX             ; AX = (万位×10+千位) × 10
    
    ; --- 百位处理 (0202H) ---
    MOV  DL, [0202H]    ; 读取百位BCD
    XOR  DH, DH
    ADD  AX, DX         ; AX = (万位×100+千位×10) + 百位
    MUL  BX             ; AX = (万位×100+千位×10+百位) × 10
    
    ; --- 十位处理 (0203H) ---
    MOV  DL, [0203H]    ; 读取十位BCD
    XOR  DH, DH
    ADD  AX, DX         ; AX = (万位×1000+千位×100+百位×10) + 十位
    MUL  BX             ; AX = (万位×1000+千位×100+百位×10+十位) × 10
    
    ; --- 个位处理 (0204H) ---
    MOV  DL, [0204H]    ; 读取个位BCD
    XOR  DH, DH
    ADD  AX, DX         ; AX = 最终16进制值 (0~65535)
    
    JMP  $              ; 结果在AX中
CODE ENDS
END START