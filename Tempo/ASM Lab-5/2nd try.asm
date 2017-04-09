 .MODEL SMAL
.STACK 100H
.DATA 

VAR1 DW 10
A DW  0  
TEMP DW  ?
T DW ? 
B DB 0
C DB 0

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
     
     
     
     INPUT:
          
          MOV AH,1
          INT 21H 
          
          CMP AL,0DH
          JZ DIVIDE   
          
          SUB AL,30H 
          
          XOR AH,AH  
          
          MOV TEMP,AX 
          
          MOV AX,A
          MUL VAR1  
          
          ADD AX,TEMP
          MOV A,AX
          
          MOV CX,AX 
          INC B
          
          JMP INPUT  
         
          DIVIDE:
                MOV AX,CX
                MOV BH,10
                DIV BH
                MOV BL,AH
                MOV DH,AL
                
                
                
                
                
                
                ADD BL,30H
                
                MOV AH,2
                MOV DL,BL
                INT 21H
                
                
                
                
                
                
                XOR AX,AX 
                MOV AL,DH
                MOV CX,AX
                 
                DEC B
                CMP B,0 
                
                JZ EXIT
                JMP DIVIDE
                
           
          
          
          
    EXIT:   
           
          
          
          
               
          
    
    
    
MAIN ENDP
END MAIN