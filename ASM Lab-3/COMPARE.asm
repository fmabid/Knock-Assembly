.MODEL SMALL
.STACK 100H

.DATA
 
 VAR1 Db ?
 VAR2 Db ?
 COMPVAR1 DB 31H
 COMPVAR2 DB 32H

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV VAR1,BL
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV VAR2,BL
    
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    
    MOV BL,COMPVAR1
    CMP VAR1,BL
    JZ IF
    
    MOV BL,COMPVAR2
    CMP VAR2,BL
    JZ ELSE
    
    
    IF:
        MOV AH, 2
        MOV DL, '*'
        INT 21H
    
    ELSE:
        MOV AH, 2
        MOV DL, '#'
        INT 21H
    
    
    MOV AH, 4CH
    INT 21H 
       
 MAIN ENDP 
END MAIN  
