.MODEL SMALL

.STACK 100H 

.DATA
    W DW 10 DUP(?)
    
    A DW ?
    B DW ?
    CHK DW ? 
    
    
    MSG1 DB 'FOUND!$' 
    MSG2 DB 'NOT FOUND!$'


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
    
    
    XOR BX,BX
    
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV BL, AL
    MOV CHK,BX 
    
    
    XOR DX,DX
    XOR BX,BX
    XOR CX, CX
    MOV CX,A 
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
    

    SRCH:
        MOV DX, W[BX]
    	CMP DX, CHK
    	JE FOUND
    	ADD BX,2
    	LOOP SRCH
    	JMP NOT_FOUND 
	
	FOUND:
	    LEA DX, MSG1   ; LEA = Load Effective Address
        MOV AH, 9
        INT 21H
        JMP NULL
        
    NOT_FOUND:
	    LEA DX, MSG2   ; LEA = Load Effective Address
        MOV AH, 9
        INT 21H 
	
	NULL:
	
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN