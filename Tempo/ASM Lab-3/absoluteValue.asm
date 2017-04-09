.MODEL SMALL
.STACK 100H

.DATA
 
 VAR1 Db ?
 VAR2 DD ?
 COMPVAR1 DD 31H
 COMPVAR2 DD 30H

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    
    MOV BL,-34H
    NEG BL
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H 
       
 MAIN ENDP 
END MAIN  
