 ; print_my_name.asm
 
 print_my_name PROC
    
    PUSH CX
    PUSH myName
    
    XOR DX, DX  ; DX = 0
    
    NAME:
       LEA DX, CX   ; LEA = Load Effective Address
       MOV AH, 9
       INT 21H 
      
    POP CX
    POP myName        
    
    RET
 print_my_name ENDP