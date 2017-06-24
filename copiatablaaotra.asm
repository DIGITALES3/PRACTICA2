			;¦Se copia la TABLA1 en el area reservada llamada TABLA2. 
			;Observe que la cantidad de bytes en la TABLA1 coincide con la cantidad de bytes reservados en la TABLA2.¦
		.MODEL SMALL
		.STACK 100H
		.DATA
TABLA1 	DB 05H,07H,03H,01H,00H,02H,08H,09H,04H,06H
TABLA2 	DB 10 DUP(?)
TABLA3	DW 05 DUP(?)
VAR_1	DW ?
VAR_2 	DW ?
		.CODE
INICIO	MOV AX,SEG TABLA1
		MOV DS,AX
		;¦En esta sección del programa se copia la TABLA1 en el area reservada llamada TABLA2. 
		;Observe que la cantidad de bytes en la TABLA1 coincide con la cantidad de bytes reservados en la TABLA2.¦
		MOV CX,0AH
		MOV SI,OFFSET TABLA1
		MOV DI,OFFSET TABLA2
LAZO1:	MOV AL,DS:[SI]
		MOV DS:[DI],AL
		INC SI
		INC DI
		LOOP LAZO1
		;¦En esta seccion del programa se copia la TABLA1 en el area reservada llamada TABLA3. Observe que la cantidad de bytes en la TABLA1
		;coincide con la cantidad de bytes reservados en la TABLA3, solo que para este caso en la TABLA3 se reservan palabras,
		;por lo que solo se reservan 5 palabras.¦
		MOV CX,05H
		MOV SI,OFFSET TABLA1
		MOV DI,OFFSET TABLA3
LAZO2: 	MOV AX, WORD PTR DS:[SI]	;Con la directiva WORD PTR se obliga a leer TABLA1 como si fuesen palabras
		MOV DS:[DI],AX
		ADD SI,0002H
		ADD DI,0002H
		LOOP LAZO2
		;Terminamos el programa
		MOV AX,4C00H
		INT 21H
		END INICIO
		END
		
		
	