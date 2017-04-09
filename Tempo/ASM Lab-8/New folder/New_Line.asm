

New_Line PROC
    
    
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
     
    
    RET

New_Line ENDP