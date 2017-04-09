.MODEL SMALL

.STACK 100H 

.DATA
    W DW 10 DUP(?)
    SUMw DW ?
    
    A DW ?
    B DW ? 
    VAR DW 3


.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS, AX 
    
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
    
    
    XOR DX,DX
    XOR BX,BX
    XOR CX,CX
    
    MOV CX, A
    
    XOR AX,AX
    SUM:
    	ADD DX,W[BX]
    	MOV SUMw, DX
    	MUL VAR
    	ADD BX,VAR
    	LOOP SUM 
	
	
	XOR AX,AX
	MOV AX, SUMw
	
	MOV DL, AL ; Output from DL
	ADD DL, 30H        
    MOV AH, 2  ; AH = 2 (output)
    INT 21H
	
	
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN