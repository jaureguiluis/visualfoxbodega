*    ESTE REPORTE OBTIENE EL BALANCE GENERAL
*
@ 4, 1 TO 21,78 CLEAR
@23, 1 SAY SPACE(78)
XTITULO = 'BALANCE GENERAL'
SINO    = 'S'
XDEST   = 'T'
XFECHA  = FFFFFF
@5,20 SAY XTITULO
@10,20 SAY 'Teclee Fecha del Balance General :  ' GET XFECHA
@18,20 SAY 'Informacion en <I>mpresora o <T>erminal ' GET XDEST PICT '@M I,T'
@23,25 SAY '<ESC> Terminar'
READ
IF LASTKEY() = 27
   RETURN
ENDIF
@23, 1 SAY SPACE(78)
SET COLOR TO 7*
@23,20 SAY 'FAVOR DE ESPERAR UN MOMENTO ....'
SET COLOR TO &XCOLOR
SELECT 3
USE &XPATCB\POLIZA INDEX &XPATCB\POLIZA
XULTMES = MONTH(FECHA)
DO WHILE .NOT. EOF()
   IF XULTMES < MONTH(FECHA)
      XULTMES = MONTH(FECHA)
   ENDIF
   SKIP
ENDDO
SELECT 1
USE &XPATCB\CUENTA INDEX &XPATCB\CUENTA ALIAS CUENTA
SELECT 2
USE &XPATCB\SALDOS INDEX &XPATCB\SALDOS
SET RELATION TO STR(CUENTA,4)+STR(SCUENTA,4)+STR(0,3)+STR(0,3) INTO CUENTA
XMESBAL = MONTH(XFECHA)
IF XMESBAL <> XULTMES
   XMESBAL = XULTMES
ENDIF
XTITULO = XTITULO + ' AL '+STR(DAY(XFECHA),2)+' DE '+NMES(XMESBAL)+' DE '+STR(YEAR(XFECHA),4)
NPAG  = 0
N     = NLPP
XNLPP = NLPP
SET DEVICE TO PRINT
IF XDEST = 'T'
   XT=XTERMINAL+'.TXT'
   SET PRINTER TO &XT
ENDIF
??? CHR(18)
STORE 0 TO XTACTIVO,XTPASIVO,XTCAPITAL,XTINGRESOS,XTEGRESOS,XSALDO,XTSALDO
STORE 0 TO XTCOSTOS,XTGASTOS,XRESULTADO,XTTSALDO
DO WHILE .NOT. EOF()
   XCUENTA = CUENTA
   DO WHILE XCUENTA = CUENTA .AND. .NOT. EOF()
      XSCUENTA = SCUENTA
      DO WHILE XSCUENTA = SCUENTA .AND. .NOT. EOF()
         IF N>=XNLPP
            NPAG = NPAG + 1
            @0,10  SAY FFFFFF
            @0,69  SAY 'PAGINA :'
            @0,78  SAY NPAG PICT '999'
            IF XDEST = 'I'
               ??? CHR(14)
               @1,(44-LEN(XCIA))/2 SAY XCIA
               ??? CHR(15)+CHR(14)
               @2,(70-LEN(XTITULO))/2 SAY XTITULO
               ??? CHR(18)
            ELSE
               @1,(80-LEN(XCIA))/2 SAY XCIA
               @2,(80-LEN(XTITULO))/2 SAY XTITULO
               XNLPP = 10000
            ENDIF
            @4,20  SAY 'C U E N T A'
            @4,60  SAY '  I M P O R T E'
            @5,10  SAY REPLICATE('=',64)
            N=5
         ENDIF
         XSSCUENTA = SSCUENTA
         XNOMBRE = CUENTA->NOMBRE
         DO WHILE XSSCUENTA = SSCUENTA .AND. .NOT. EOF()
            IF PERIODO <= XMESBAL
               XSALDO = XSALDO + CARGOS - ABONOS
            ENDIF
            SKIP
         ENDDO
         IF XSALDO <> 0 .AND. XCUENTA <= 3000
            N=N+1
            @N,1 SAY XSSCUENTA
            @N,15 SAY XNOMBRE
            IF XCUENTA <> 1000
               @N,60 SAY XSALDO*-1 PICT '9999,999,999.99'
            ELSE
               @N,60 SAY XSALDO   PICT '9999,999,999.99'
            ENDIF
         ENDIF
         XTSALDO = XTSALDO + XSALDO
         STORE 0 TO XSALDO
      ENDDO
      IF XSCUENTA =1100
         N = N + 1
         @N,60 SAY '---------------'
         N = N + 1
         @N,10 SAY 'TOTAL DE ACTIVO CIRCULANTE'
         @N,60 SAY XTSALDO  PICT '9999,999,999.99'
         N = N + 2
      ENDIF
      IF XSCUENTA = 1200
         N = N + 1
         @N,60 SAY '--------------'
         N = N + 1
         @N,10 SAY 'TOTAL ACTIVO FIJO'
         @N,60 SAY XTSALDO PICT '9999,999,999.99'
      ENDIF
      IF XSCUENTA = 1300
         N = N + 1
         @N,60 SAY REPLICATE("-",15)
         N = N + 1
         @N,10 SAY 'TOTAL ACTIVO DIFERIDO'
         @N,60 SAY XTSALDO PICT '9999,999,999.99'
      ENDIF
      IF XSCUENTA = 2100
         N = N + 1
         @N,60 SAY '---------------'
         N = N + 1
         @N,10 SAY 'TOTAL DE PASIVO CIRCULANTE'
         @N,60 SAY XTSALDO*-1  PICT '9999,999,999.99'
         N = N + 2
      ENDIF
      IF XSCUENTA = 2200
         N = N + 1
         @N,60 SAY '--------------'
         N = N + 1
         @N,10 SAY 'TOTAL PASIVO FIJO'
         @N,60 SAY XTSALDO*-1 PICT '9999,999,999.99'
      ENDIF
      IF XSCUENTA = 2300
         N = N + 1
         @N,60 SAY REPLICATE("-",15)
         N = N + 1
         @N,10 SAY 'TOTAL PASIVO DIFERIDO'
         @N,60 SAY XTSALDO*-1 PICT '9999,999,999.99'
      ENDIF
      XTTSALDO = XTTSALDO + XTSALDO
      STORE 0 TO XTSALDO
   ENDDO
   IF XCUENTA = 1000
      N = N + 1
      @N,60 SAY '---------------'
      N = N + 1
      @N,10 SAY 'T O T A L  A C T I V O'
      @N,60 SAY XTTSALDO  PICT '9999,999,999.99'
      N = N + 1
      @N,60 SAY '==============='
      N = N + 3
      XTACTIVO = XTTSALDO
   ENDIF
   IF XCUENTA = 2000
      N = N + 1
      @N,60 SAY '---------------'
      N = N + 1
      @N,10 SAY 'T O T A L  P A S I V O'
      @N,60 SAY XTTSALDO*-1  PICT '9999,999,999.99'
      N = N + 1
      @N,60 SAY '==============='
      N = N + 3
      XTPASIVO = XTTSALDO
   ENDIF
   IF XCUENTA = 3000
      XTCAPITAL = XTTSALDO
   ENDIF
*   IF XCUENTA > '3'
*      XTINGRESOS = XTTSALDO
*   ENDIF
*   IF XCUENTA = '5'
*     XTCOSTOS = XTTSALDO
*   ENDIF
*   IF XCUENTA = '6'
*      XTGASTOS = XTTSALDO
*   ENDIF
*   IF XCUENTA = '7'
*      XTGASTOS = XTGASTOS+XTTSALDO
*   ENDIF
   XTTSALDO = 0
ENDDO
XRESULTADO = XTACTIVO+XTCAPITAL+XTPASIVO
IF XRESULTADO > 0
   N = N + 1
   @N,15 SAY 'UTILIDAD DEL EJERCICIO'
   @N,60 SAY XRESULTADO  PICT '9999,999,999.99'
ENDIF
IF XRESULTADO < 0
   N = N + 1
   @N,15 SAY 'PERDIDA DEL EJERCICIO'
   @N,60 SAY XRESULTADO*-1  PICT '9999,999,999.99'
ENDIF
N = N + 1
@N,60 SAY '---------------'
N = N + 1
@N,10 SAY 'T O T A L  C A P I T A L'
@N,60 SAY (XTCAPITAL-XRESULTADO)*-1   PICT '9999,999,999.99'
N = N + 1
@N,60 SAY '==============='
N = N + 2
@N,10 SAY 'TOTAL  PASIVO Y CAPITAL'
@N,60 SAY (XTCAPITAL-XRESULTADO+XTPASIVO)*-1   PICT '9999,999,999.99'
N = N + 1
@N,60 SAY '==============='
EJECT
SET DEVICE TO SCREEN
CLOSE DATABASES
IF XDEST = 'T'
   DO TERMINAL
ENDIF
RETURN
