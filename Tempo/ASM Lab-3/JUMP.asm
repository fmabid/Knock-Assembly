.MODEL SMALL
.STACK 100H

.DATA
 

.CODE
 
 
 MAIN PROC
    
    JMP ELSE
    
    IF:
        MOV AH, 2
        MOV DL, '*'
        INT 21H
    
    ELSE:
        MOV AH, 2
        MOV DL, '#'
        INT 21H
    
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H 
       
 MAIN ENDP 
END MAIN  
