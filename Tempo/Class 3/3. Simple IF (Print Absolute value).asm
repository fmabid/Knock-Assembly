.MODEL SMALL

.STACK 100H 

.DATA
    
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX  
     
    MOV BL,-2
    
	CMP BL,0
	JNL NEXT	;ALSO CAN USE JGE
	NEG BL

NEXT:
	MOV AH,2
	MOV DL,BL
	ADD DL,30H
	INT 21H
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN