.MODEL SMALL
.STACK 100H

.DATA
 
 VAR1 DB ?
 VAR2 DW ?
 VAR3 DW ?
 COUNT DW 32H

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
     
    
        OUTER:
            XOR CX,CX
            MOV CX,VAR2
            SUB VAR2,2
            MOV BL,30H 
            ADD BL,30H
            CMP BX,VAR2
            JE LOOPOUT
            
        
        INEER: 
            MOV AH, 2
            MOV DL, '*'
            INT 21H
               
            
            LOOP INEER 
            
            MOV AH, 2
            MOV DL, 0AH ;New line
            INT 21H
            MOV DL, 0DH ;Move cret
            INT 21H
            MOV DL, 1FH ;Space
            INT 21H 
            
            LOOP OUTER
            
  
                        
     
    LOOPOUT: 
     
              
              
 MAIN ENDP 
END MAIN  
