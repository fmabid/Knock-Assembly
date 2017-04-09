.MODEL SMALL

.STACK 100H 

.DATA
W DW 10 DUP(?)
O DB 4 
C DW ?
MSG1 DB  'PLEASE ENTER YOUR ARRAY SIZE:$'
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    LEA DX,MSG1      
        MOV AH,9
        INT 21H
        MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H  
    
     MOV AH,1
     INT 21H 
     MOV BL,AL
     SUB BL,30H 
     
     XOR BH,BH 
     
     MOV CX,BX
     MOV C,BX
     MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H
      XOR BX,BX  
      
      
      
      
    INPUT:
        MOV AH,1
        INT 21H 
        MOV DH,AL
        SUB DH,30H
        
        XOR DL,DL
        MOV W[BX],DX
        ADD BX,2
        LOOP INPUT 
        
        
   MOV CX,C 
   XOR AX,AX
   XOR BX,BX
   XOR DX,DX
   MOV BX,-2
   
   
      
   INDEX:
   CMP CX,0
   JZ END
    ADD BX,2
    MOV AX,BX
    DIV O
    CMP AH,0  
    JZ SUM
    
   
	LOOP INDEX   
	
	
	SUM:
	   
    ADD DX,W[BX]
    DEC CX 
    JMP INDEX
	
    MOV AH,4CH
    INT 21H
    
    END:
       
       MOV AH,2 
       MOV DL,0AH
       INT 21H
       MOV DL,0DH
       INT 21H
       ADD DH,30H
       MOV DL,DH
       INT 21H
       
    
MAIN ENDP

END MAIN