
.MODEL SMALL
.STACK 100H

.DATA

 VAR1 Db ?
 VAR2 Db ?

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    MOV AH, 1  ; AH = 1 (input)
    INT 21H
    MOV BL,AL
    MOV VAR1, BL
    
    INT 21H
    MOV BH,AL
    MOV VAR2, BH
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    

    MOV DL, VAR1
    INT 21H
    MOV DL, VAR2
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    
    MOV BL, VAR1
    XCHG BL, VAR2
    MOV VAR1,BL
    
    MOV DL, VAR1
    INT 21H
    MOV DL, VAR2
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
       
       
 MAIN ENDP 
END MAIN  
