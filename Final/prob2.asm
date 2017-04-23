.MODEL SMALL

.STACK 100H 

.DATA
    W DW 10 DUP(?)
    SUM DW ?
    
    A DW ?
    B DW ? 
    VAR DW 3 
    
    MSG1 DW ?


.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS, AX  
    MOV ES, AX
    
    MOV AH, 1  ; AH = 1 (input)
    INT 21H
    SUB AL, 30H
    XOR BX,BX
    MOV BL,AL
    MOV A, BX
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
        
    
    XOR BX,BX
    MOV CX,A
        
    INP:
        MOV AH,1
        INT 21H
        MOV DL, AL
        
        SUB DL, 30H
        MOV W[BX], DX
        ADD BX, 2 
        LOOP INP
          
    
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
       
    
    XOR AX, AX
    
    CHK:    
        MOV AX, A
        MOV DL, 2
        DIV DL
        CMP AH, 0
        JZ EVEN_SUM
        
    
    
    XOR AX, AX
    XOR CX, CX
    MOV CX, A        
    XOR BX, BX    
        
    EVEN_SUM: 
        ADD AX, W[BX]
        ADD BX, 2 
        MOV SUM, AX
        JMP CHK
	
	END:
	
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN