.MODEL SMALL
.STACK 100H

.DATA  
    COUNT DW 30H    

.CODE

 MAIN PROC
   
    MOV AX, @DATA
    MOV DS, AX       ; DS= data segment register
   
    XOR CX, CX  
    
    INPUT:
        MOV AH, 1
        INT 21H       ;input
        MOV BL, AL
        
        CMP BL, 0DH
        JE NEW_LINE   ;stop on enter
        
        SUB AL, 30H
        MOV DL, AL 
        INC COUNT
        
        PUSH DX
        JMP INPUT
               
               
    NEW_LINE:
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
        
        ;PUSH COUNT
        
        CALL OUTPUT
        
          
    
    MOV AH, 4CH
    INT 21H
       
 MAIN ENDP
 
 INCLUDE output.asm 

 
END MAIN