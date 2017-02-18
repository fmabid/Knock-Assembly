.MODEL SMALL
.STACK 100H

.DATA
 
 VAR1 Db ?
 VAR2 Db 32H
 MSG1 DW 'ODD?'
 MSG2 DW 'EVEN?'

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    
    MOV BL,127
    SUB BL,30H
    MOV CL,BL

    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    
    MOV BL,30H
    
    LOOP1:
        SUB CL,2
        CMP CL,BL
        JZ EVEN
        JL ODD
        JMP LOOP1

    ODD:
        MOV DL,31H
        MOV AH, 2
        INT 21H
        JMP NULL
        
    EVEN:
        MOV DL,30H
        MOV AH, 2
        INT 21H
        
   
        
     NULL:   
    
    
    MOV AH, 4CH
    INT 21H 
       
 MAIN ENDP 
END MAIN  
