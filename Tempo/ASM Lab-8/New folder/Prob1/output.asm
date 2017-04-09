;output.ASM

OUTPUT PROC  
    
    MOV AX, @DATA
    MOV DS, AX       ; DS= data segment register
    
    
    PUSH COUNT
    
    
    MOV CX, COUNT
    SUB CX, 30H
    
    OTP:      
        POP DX
        XOR BX, BX
        MOV BX, DX
        
        
        MOV AH, 2
        MOV DL, BL
        INT 21H
        
        MOV DL, BL
        
        LOOP OTP
    
    
    POP COUNT
    
    
    
    RET
    
OUTPUT ENDP   