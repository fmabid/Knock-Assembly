.MODEL SMALL

.STACK 100H 

.DATA
W DW 10,20,30,40,50,60

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX  
    
   XOR AX,AX
   LEA SI,W
   MOV CX,6

SUM:
	ADD AX,[SI]
	ADD SI,2
	LOOP SUM
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN