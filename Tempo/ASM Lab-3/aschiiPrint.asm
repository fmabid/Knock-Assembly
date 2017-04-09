.MODEL SMALL
.STACK 100H

.DATA
 
 VAR1 DD ?
 VAR2 DD ?
 COMPVAR1 DD 31H
 COMPVAR2 DD 30H

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    
    MOV BL,00H
    MOV CX,127
    
    
    LOOP10:
        MOV AH,2
        MOV DL,BL
        INT 21H
        INC BL
        MOV AH, 2
        
        MOV DL, 0AH ;New line
        INT 21H
        MOV DL, 0DH ;Move cret
        INT 21H
        
        JZ ENDLOOP
        JMP LOOP10
        
    ENDLOOP:
       
    
    
    MOV AH, 4CH
    INT 21H 
       
 MAIN ENDP 
END MAIN  
