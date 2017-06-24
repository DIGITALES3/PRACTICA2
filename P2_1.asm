			;PRACTICA 2
			.MODEL SMALL
			.STACK 100H
			.DATA
MAESTRA		DB 9 DUP (?), 20 DUP(?), 20 DUP(?), 2 DUP(?), 1 DUP(?), 1 DUP(?)		;Esto es un ejemplo de las tablas llenas
			DB 9 DUP (?), 20 DUP(?), 20 DUP(?), 2 DUP(?), 1 DUP(?), 1 DUP(?)		;Esto es un ejemplo de las tablas llenas
SALIDA		DB 53 DUP(?)															;Esto es un ejemplo de las tablas llenas
			.CODE	
INICIO		MOV AX,SEG MAESTRA
			MOV DS,AX
			MOV BX,00080H
			MOV AL,ES:[BX]
			CMP AL,03H
			JE UNP					;UNP= UN PARAMETRO
			CMP AL,06H				; ¿SI SERIA 06H, NO?
			JE DOSP					;DOSP= DOS PARAMETROS
			CMP AL,09H				; ¿SI SERIAN 09H, NO?
			JE TRESP				; TRESP= TRES PARAMETROS
			JNE MALO				;------LLENAR LA TABLA EN FUNCION DE LA ELECCION------
UNP:	MOV CX,40						
		MOV DX,00H
		MOV BX,0082H
		MOV AX,ES:[BX]			
		CMP AX,"F/"
		JE ES_F
		CMP AX,"f/"
		JE ES_F
		CMP AX,"H/"
		JE ES_H
		CMP AX,"h/"
		JE ES_H
		CMP AX,"I/"
		JE ES_I
		CMP AX,"i/"
		JE ES_I
		CMP AX,"S/"
		JE ES_S
		CMP AX,"s/"
		JE ES_S
		CMP AX,"M/"
		JE ES_M
		CMP AX,"m/"
		JE ES_M
		JMP MALO 			;--------COMPROBAMOS SI LA FILA ES "F", PARA EN ESE CASO LLENAR ------
ES_F:	ADD SI,52			; Nos posicionamos en SEXO, creo que SI por defecto está en 0000H
		MOV AL,DS:[SI]
		CMP AL,"F"
		JE NO				;NO= NO ORDEBADO
		CMP AL,"f"
		JE NO
		ADD SI,02
		LOOP ES_F	
NO:		MOV DX,53
		DEC SI,50	
LLENAR:	MOV AL,DS:[SI] 		
		MOV DS:[BX],AL
		INC SI,
		INC BX
		DEC DX
		JZF ----> 		; BUSCAR SALTO QUE HAGA QUE CUANDO DX SEA 0 TERMINE EL CONTADOR Y SALGA A JMP ES_F
		LOOP LLENAR
		JMP ES_F
		
