.MODEL SMALL
.STACK 100H
                     
                     
.DATA
    VAR1 DB ?
    VAR2 DB ?        


.CODE
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX      ; DS = data segment register   
   
    INPUT:
        MOV AH, 1  ; AH = 1 (input)
        INT 21H            
        MOV VAR1, AL  
        
        MOV AH, 2  
        MOV DL, 0AH ;New line
        INT 21H
        MOV DL, 0DH ;Move cret
        INT 21H    
        
        MOV AH, 1  ; AH = 1 (input)
        INT 21H          
        MOV VAR2, AL 
                     
                     
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
                 
                 
    SUM:   
        MOV BL, VAR1
        MOV CL, VAR2
        
        ADD BL, CL 
        SUB BL, 30H 
        MOV AH, 2  ; AH = 2 (output)
        MOV DL, BL ; Output from DL 
        INT 21H   
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    
    DIF:
        SUB BL, CL
        ADD BL, 30H 
        MOV AH, 2  ; AH = 2 (output)
        MOV DL, BL ; Output from DL 
        INT 21H 
        
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
     
    MULT:
        XOR AX, AX 
        MOV CL, VAR2
        SUB CL,30H
        MOV AL, VAR1 
        SUB AL, 30H
        MUL CL    
        MOV AH, 2  ; AH = 2 (output)
        ADD AL, 30H
        MOV DL, AL ; Output from DL 
        INT 21H
     
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    
    DIVI:
        XOR AX, AX 
        MOV CL, VAR2
        SUB CL,30H
        MOV AL, VAR1 
        SUB AL, 30H
        DIV CL    
        MOV AH, 2  ; AH = 2 (output)
        ADD AL, 30H
        MOV DL, AL ; Output from DL 
        INT 21H
            

    
 MAIN ENDP 

END MAIN