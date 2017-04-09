.MODEL SMALL
.STACK 100H

.DATA
 
 VAR DB ?
 VAR1 DB ?
 VAR2 DB ?
 MAX DB ?  
 MIN DB ?
 
 KEEP DW ?
 

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX       ; DS= data segment register
      
  
    
   
    MOV AH,1
    INT 21H
    SUB AL,30H 
    MOV BL, AL
    MOV VAR, BL
    MOV MAX, BL 
    MOV MIN,BL
 
    
    MOV AH,1
    INT 21H 
    SUB AL,30H
    MOV VAR1,AL
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV VAR2,AL
    
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H  
    
    
    LBL1:   
        MOV BL,VAR1
        CMP BL,MIN
        JL ASSIGN1
        JMP LBL2
    
    LBL2:
        MOV BH,VAR2
        CMP BH,MIN
        JL ASSIGN2
        JMP MN     
        
    ASSIGN1:
        MOV CL,VAR1
        MOV MIN,CL
        JMP PRINT
    
    ASSIGN2:
        MOV CL,VAR2
        MOV MIN,CL
        JMP PRINT
    
    MN:
        MOV BL,VAR
        MOV MIN,BL
        JMP PRINT    
    
    
    
    PRINT:
        MOV AH,2
        MOV DL,MIN
        ADD DL,30H
        INT 21H
    
        
        
    EXIT:
       
 MAIN ENDP 
END MAIN  
