******************** PROCEDIMIENTO MONTO ************************
*Este parametro Recibe un Valor N�merico
*Asi lo Valida
* si lo vas utilizar desde dentro de un Form enviale como parametro el numero 
* a conventri en letras. en este ejemplo le coloco directamente el valor a   
* convertir.

parameter xpvalor,xmoneda
pvalor = xpvalor


IF pvalor <= 0
	Return
Endif
* Le devuelvo la parte enetra del Valor a la variable EnteroV
ENTEROV=INT(pvalor)
N = ""
N1 = "UN"
N2 = "DOS"
N3 = "TRES"
N4 = "CUATRO"
N5 = "CINCO"
N6 = "SEIS"
N7 = "SIETE"
N8 = "OCHO"
N9 = "NUEVE"
N10 = "DIEZ"
N11 = "ONCE"
N12 = "DOCE"
N13 = "TRECE"
N14 = "CATORCE"
N15 = "QUINCE"
N16 = "DIECISEIS"
N17 = "DIECISIETE"
N18 = "DIECIOCHO"
N19 = "DIECINUEVE"
N20 = "VEINTE"
N30 = "TREINTA"
N40 = "CUARENTA"
N50 = "CINCUENTA"
N60 = "SESENTA"
N70 = "SETENTA"
N80 = "OCHENTA"
N90 = "NOVENTA"
IF ENTEROV <> 100
	N100 = "CIENTO"
ENDIF
IF ENTEROV = 100
	N100="CIEN"
ENDIF
N200 = "DOSCIENTOS"
N300 = "TRESCIENTOS"
N400 = "CUATROCIENTOS"
N500 = "QUINIENTOS"
N600 = "SEISCIENTOS"
N700 = "SETECIENTOS"
N800 = "OCHOCIENTOS"
N900 = "NOVECIENTOS"
CONTADOR = 1
INICIO = 1
CADENA = STR(ENTEROV,9)
NUMP = " "
DO WHILE CONTADOR < 4
	SUBCADENA = SUBSTR(CADENA,INICIO, 3) 
	CENTENA = SUBSTR(SUBCADENA,1,1)+"00" 
	DECENA = SUBSTR(SUBCADENA,2,2)
	UNIDAD = SUBSTR(SUBCADENA,3,1)
	IF VAL(SUBCADENA) > 99
		NUMP = NUMP + N&CENTENA + " "
	ENDIF (SUBCADENA > 99)
	T = VAL(DECENA)
	IF T > 0
		DO CASE
			CASE (INT(T/10.0) = T/10.0) .OR. (T > 9 .AND. T < 20) 
				NUMP = NUMP + N&DECENA 
			CASE T > 9 .AND. (INT(T/10.0) # T/10.0)
				DECENA = SUBSTR(DECENA,1,1) + "0"
				IF DECENA # "20"
					NUMP = NUMP + N&DECENA + " Y " + N&UNIDAD
				ELSE
					NUMP = NUMP + "VENTI" + N&UNIDAD
				ENDIF
			CASE T < 10
			NUMP = NUMP + N&UNIDAD
	ENDCASE 
	ENDIF (T > 0)

	IF ENTEROV > 999999 .AND. CONTADOR = 1
		NUMP = NUMP + " MILLONES "
	ENDIF
	IF NUMP = " UNO MILLONES "
		NUMP = " UN MILLON "
	ENDIF
	IF NUMP = " CIENTO  MIL "
		NUMP = " CIEN MIL "
	ENDIF
	
	IF ENTEROV > 999 .AND. CONTADOR = 2 .AND. VAL(SUBCADENA) > 0
		NUMP = NUMP + " MIL "
	ENDIF
	IF NUMP = " UNO MIL "
		NUMP = " MIL "
	ENDIF
	INICIO = CONTADOR * 3 + 1
	CONTADOR = CONTADOR + 1
ENDDO
	CENTAV = pvalor-INT(pvalor)
*	CENTAV = THISFORM.VABO.VALUE - INT(THISFORM.VABO.VALUE)
	CENTAV = ROUND((CENTAV*100),0)	
	CENTAV = INT(CENTAV)	
	CENTAV = STR(CENTAV,2)
	CENTAV = STRTRAN(CENTAV," ","0")
	IF xmoneda = 0	
	NUMP =  + "**(" + NUMP + " PESOS " +  CENTAV + "/100 M.N.)**"
	ELSE
	NUMP =  + "**(" + NUMP + " PESOS " +  CENTAV + "/100 DOLARES)**"
	ENDIF
	
	xletra =nump
* Al Final en Nump Esta el Valor en Letras
*?nump
return	
