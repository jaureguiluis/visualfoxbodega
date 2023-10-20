*  GENERA LOS GASTOS
*
STORE DATE() TO XFECHAI,XFECHAF
XFECHAI = XFECHAI-DAY(XFECHAI)+1
SINO    = 'S'
XDEST   = 'T'
@04,1 TO 21,78 CLEAR
@23,1 SAY SPACE(77)
XTITULO='REPORTE DE GASTOS DE INVENTARIO'
@4,20  SAY XTITULO
@08,20 SAY 'Teclee Fecha Inicial :        ' GET XFECHAI
@10,20 SAY 'Teclee Fecha Final :          ' GET XFECHAF
@18,20 SAY 'Informacion en <I>mpresora O <T>erminal : ' GET XDEST PICT '@M I,T'
@23,25 SAY '<ESC> Terminar'
READ
IF LASTKEY() = 27 
   CLOSE DATABASES
   RETURN
ENDIF
SELECT 3
USE &XPATCB\POLIZA INDEX &XPATCB\POLIZA
SORT ON CUENTA,SCUENTA,ARTICULO,FECHA FOR FECHA >= XFECHAI .AND. FECHA <=XFECHAF .AND. (CUENTA = 1130 .OR. CUENTA = 1135) TO &XTERMINAL
SELECT 4
USE &XTERMINAL
SET FILTER TO  ARTICULO <> '        '
*SET FILTER TO SUBSTR(CONCEPTO,1,1) <> "*"
GO TOP
IF EOF()
   CLOSE DATABASES
   RETURN
ENDIF
NLPP = 63
NPAG  = 0
N     = NLPP
XNLPP = NLPP
SET DEVICE TO PRINT
IF XDEST = 'T'
   XT=XTERMINAL+'.TXT'
   SET PRINTER TO &XT
ENDIF
??? CHR(18)
STORE 0 TO XTTTVALOR
DO WHILE .NOT. EOF()
   XSCUENTA = SCUENTA
   STORE 0 TO XTTVALOR
   DO WHILE SCUENTA = XSCUENTA .AND. .NOT. EOF()
      XARTICULO = ARTICULO
      STORE 0 TO XTVALOR
      DO WHILE ARTICULO = XARTICULO .AND. SCUENTA = XSCUENTA .AND. .NOT. EOF()
         IF N >= XNLPP
            NPAG = NPAG + 1
            @0,01 SAY DATE()
            @0,70 SAY 'PAG :'
            @0,78 SAY NPAG PICT '9999'
            IF XDEST ='I'
               @1,4 SAY  CHR(18)+CHR(14)
               @1,(44-LEN(XCIA))/2 SAY XCIA
               @2,4 SAY CHR(15)+CHR(14)
               @2,(70-LEN(XTITULO))/2 SAY XTITULO
               @3, 47 SAY 'DEL ' + DTOC(XFECHAI) + '  AL  ' + DTOC(XFECHAF)
            ELSE
               @1,20 SAY XCIA
               @2,20 SAY XTITULO
               @3,20 SAY 'DEL ' + DTOC(XFECHAI) + '  AL  ' + DTOC(XFECHAF)
               XNLPP = 10000
            ENDIF
            @4,0   SAY  CHR(18)
            @4,3   SAY 'C U E N T A'
            @4,26  SAY 'FECHA'
            @4,32  SAY 'C O N C E P T O'
            @4,67  SAY '    VALOR'
            @5,0   SAY REPLICATE('=',80)
            N=5
         ENDIF
            N=N+1
            @N,0   SAY STR(CUENTA,4)+STR(SCUENTA,4)+STR(SSCUENTA,3)
            @N,12  SAY POLIZA PICT '9999'
            @N,17  SAY FECHA
            @N,28  SAY CONCEPTO PICT 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
            @N,66  SAY VALOR PICT '999,999,999.99'
            IF MOVIMIENTO = '+'
               XTVALOR = XTVALOR + VALOR
            ELSE
               XTVALOR = XTVALOR - VALOR
            ENDIF
         SKIP
      ENDDO      
      N = N + 1
      @N,030 SAY 'TOTAL ARTICULO: '+XARTICULO
      @N,66  SAY XTVALOR    PICT '999,999,999.99'
      XTTVALOR    = XTTVALOR    + XTVALOR
   ENDDO      
   N = N + 1
   @N,66 SAY '--------------'
   N = N + 1
   @N,40 SAY 'SUB TOTAL '
   @N,66 SAY XTTVALOR    PICT '999,999,999.99'
   N = N + 1
   XTTTVALOR    = XTTTVALOR    + XTTVALOR
ENDDO
N = N + 1
@N,66 SAY '--------------'
N = N + 1
@N,40 SAY 'TOTAL GENERAL'
@N,66  SAY XTTTVALOR    PICT '999,999,999.99'
EJECT
SET DEVICE TO SCREEN
CLOSE DATABASES
IF XDEST = 'T'
   DO TERMINAL
ENDIF
RETURN
