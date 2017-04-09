.MODEL SMALL
.STACK 100H

.DATA
 
 TEMP DW ?
 VAR2 DB ?
 VAR DB 10
 A DW 0 
 B DB 0   
 COUNT DB 0
 
 KEEP DW ?
 NEW DW ?
 

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX       ; DS= data segment register
      
  
    
    LOOP1:
        MOV AH, 1
        INT 21H        ;input
        MOV BL, AL
        
        CMP BL, 0DH
        JZ NEW_LINE   
        
        SUB BL, 30H
        MOV VAR2, BL
        
        XOR AX,AX
        MOV AL,VAR2
        MOV TEMP,AX
        MOV AX,A
        MUL VAR
        ADD AX,TEMP
        MOV A,AX
        MOV KEEP, AX
        
        MOV CX, KEEP
        
        INC COUNT
        
        JMP LOOP1  
        
        
     NEW_LINE:
     MOV AH,2
     MOV DL,0DH
     INT 21H
     MOV DL,0AH
     INT 21H 
       
    
     PRINT:     
        MOV AX, KEEP
        
        DIV VAR 
        ADD AH, 30H
        MOV BL,AH
        MOV DH,AL
        
        MOV AH,2
        MOV DL,BL
        INT 21H
        
        XOR AX,AX
        MOV AL,DH
        MOV KEEP,AX
        
        INC B
        
        MOV CL,COUNT
        CMP B,CL
        JZ NULL
        
        
        JMP PRINT 
        
  
        

    NULL:  
    
    
    MOV AH, 4CH
    INT 21H 
       
 MAIN ENDP 
END MAIN  
