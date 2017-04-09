 .MODEL SMAL
.STACK 100H
.DATA 

VAR1 DW 10
A DW  0  
TEMP DW  ?

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
     
     
     
     INPUT:
          
          MOV AH,1
          INT 21H 
          
          CMP AL,0DH
          JZ EXIT
          SUB AL,30H 
          XOR AH,AH 
          MOV TEMP,AX
          MOV AX,A
          MUL VAR1
          ADD AX,TEMP
          MOV A,AX
          
          MOV CX,AX
         
          JMP INPUT  
         
          
          
          EXIT:   
           
          
          
          
               
          
    
    
    
MAIN ENDP
END MAIN