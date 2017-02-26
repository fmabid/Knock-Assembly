.MODEL SMALL
.STACK 100H

.DATA
 
 VAR1 DB ?
 VAR2 DW ?
 VAR3 DW ?
 COUNT DW ?

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    MOV AH,1
    INT 21H        ;input
    MOV BL,AL
    
    SUB BL, 30H
    MOV VAR2,BX
    
    
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H  
    
    MOV BL, 0
    MOV COUNT, BX
     
    
        OUTER:
            XOR CX, CX
            INC COUNT
            MOV CX, COUNT
            MOV BX,VAR2
            CMP BX, COUNT
            JL LOOPOUT
            
        
        INEER:
            MOV BX, COUNT
            ADD BL,30H 
            MOV AH, 2
            MOV DX, BX
            INT 21H
               
            
            LOOP INEER 
            
            MOV DL, 0AH ;New line
            INT 21H
            MOV DL, 0DH ;Move cret
            INT 21H 
            
            LOOP OUTER
            
  
                        
     
    LOOPOUT: 
     
              
              
 MAIN ENDP 
END MAIN  
