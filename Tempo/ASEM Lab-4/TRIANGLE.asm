.MODEL SMALL
.STACK 100H

.DATA
 
 VAR1 DB ?
 VAR2 DW ?

.CODE
 
 
 MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX       ; DS= data segment register
    
    MOV AH,1
    INT 21H        ;input
    MOV BL,AL
    MOV VAR1,BL
    
    SUB BL, 30H
    MOV VAR2,BX
    
    
    
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
     
    
     
    XOR CX,CX 
    
    
    MOV CX,VAR2
    
        OUTER:
            MOV CX,VAR2
            DEC VAR2
            CMP VAR2,0
            JL LOOPOUT
            
        
        INEER:
            MOV AH, 2
            MOV DL, '*'
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
