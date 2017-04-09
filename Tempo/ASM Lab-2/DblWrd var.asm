.MODEL SMALL
.STACK 100H

.DATA

 VAR DW ?   ;INT I

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    MOV AH, 1  ; AH = 1 (input)
    INT 21H
    MOV BL,AL
    MOV VAR, BX
    
    MOV AH, 1  ; AH = 1 (input)
    INT 21H
    MOV BH,AL
    MOV VAR, BX
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    
    MOV BX, VAR
    INT 21H
    MOV DL, BL
    INT 21H
    MOV DL, BH
    INT 21H
    
    
    
    MOV AH, 4CH
    INT 21H
       
       
 MAIN ENDP 
END MAIN  
