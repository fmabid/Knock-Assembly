
.MODEL SMALL
.STACK 100H

.DATA

.CODE
 
 
 MAIN PROC
    
    MOV AH, 1  ; AH = 1 (input)
    
    INT 21H    ; Call 21st interrept routine    
    MOV BH, AL ; Save input to BH
    INT 21H    ; Call 21st interrept routine    
    MOV BL, AL ; Save input to BL
    INT 21H    ; Call 21st interrept routine    
    MOV CH, AL ; Save input to BL
    INT 21H    ; Call 21st interrept routine    
    MOV CL, AL ; Save input to BL
    
       
    MOV AH, 2
    MOV DL, 0AH ;New line
    INT 21H
    MOV DL, 0DH ;Move cret
    INT 21H
     
    MOV DL, BH ; Output from DL 
    INT 21H
    MOV DL, BL ; Output from DL 
    INT 21H
    MOV DL, CH ; Output from DL 
    INT 21H
    MOV DL, CL ; Output from DL 
    INT 21H
       
       
 MAIN ENDP 
END MAIN  
