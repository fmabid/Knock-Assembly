.MODEL SMALL

.STACK 100H  

.DATA

STR DB 80 DUP(0) 
STR1 DB 80 DUP(0) 

LEN DW ?
LEN2 DW ?
 
.CODE

;
;****STRING INPUT*****
;                       
;## STORE STARTS IN THE OFFSET ADDRESS DI
;## TOTAL NUMBER OF CHAR READ IS IN BX 
;

READ_STR PROC
    PUSH AX
	;PUSH BX
    PUSH DI
   
    CLD         ;PROCESS FROM LEFT TO RIGHT
    XOR BX,BX   ;COUNTS NUMBER OF CHARACTER READ
    
    MOV AH,1
    INT 21H     ;READ CHAR IN AL
WHILE1:
    CMP AL,0DH   ;CR?
    JE READ_END
    
    CMP AL,8H    ;BACKSPACE?
    JNE ELSE1
    DEC DI       ;MOV STR POINTER BACK
    DEC BX
    JMP READ_
ELSE1:
    STOSB       ;STORE CHAR OF AL IN STR AND INCREMENTS DI
    INC BX      ;INCREMENT COUNT
READ_:
    INT 21H
    JMP WHILE1

READ_END:
    POP DI		;NOW DI POINTS TO THE STARTING OF STR 
	;POP BX
    POP AX
    RET
READ_STR ENDP

 DISPLAY_STR PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    
    MOV CX,BX			;NO. OF CHARS
    JCXZ DISPLAY_END    ;EXIT IF CX IS 0
    
    CLD
    MOV AH,2
TOP:
    LODSB			;CHAR IN AL
    MOV DL,AL
    INT 21H
    LOOP TOP

DISPLAY_END:
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_STR ENDP    

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
     LEA SI,STR
    CALL READ_STR 
    MOV LEN,BX 
    MOV CX,BX
    
     MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DI,STR1
    CALL READ_STR 
    MOV LEN2,BX
   
    REPE CMPSB
    JL PRINT
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA SI,STR1
    MOV BX,LEN2
    CALL DISPLAY_STR
    
     LEA SI,STR
    MOV BX,LEN
    CALL DISPLAY_STR
    JMP END
    
    PRINT:
        MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA SI,STR
    MOV BX,LEN
    CALL DISPLAY_STR
    
     LEA SI,STR1
    MOV BX,LEN2
    CALL DISPLAY_STR   
    END:
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN