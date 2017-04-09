.MODEL SMALL

.STACK 100H 

.DATA
W DW 10 DUP(?)
O DW 4 
C DW ? 
F DB 0
MSG1 DB  'PLEASE ENTER YOUR ARRAY SIZE:$'
MSG2 DB  'PLEASE ENTER YOUR SEARCH NUMBER:$'
MSG3 DB  'FOUND!$'
MSG4 DB  'NOT FOUND!$' 
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
     MOV C,CX
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
        
     MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H
     LEA DX,MSG2      
     MOV AH,9
     INT 21H
     MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H 
   
  
     
   MOV AH,1     
   INT 21H
    MOV DH,AL 
   SUB DH,30H
   XOR DL,DL     
   MOV CX,C 
   XOR AX,AX
   XOR BX,BX
   
   CHECK:
       MOV AX,W[BX]
       CMP AX,DX
       JZ FOUND
       MOV F,1  
       ADD BX,2
       LOOP CHECK
       
       CMP F,1
       JZ NOTFOUND
       
  
       
   FOUND: 
     MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H
     
      LEA DX,MSG3      
        MOV AH,9
        INT 21H
        JMP  EXIT
    
         
  NOTFOUND:
     MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H
     
     LEA DX,MSG4      
        MOV AH,9
        INT 21H
        JMP  EXIT 
      
   EXIT: 

    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN