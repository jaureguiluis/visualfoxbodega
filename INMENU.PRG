*   menu principal del sistema de VENTAS
PUBLIC NLPP,XCIA,FFFFFF,MES,PATVT,XCOLOR,NMES,XTERMINAL,XFI,XFF
DIMENSION NMES(12)
NMES(1) = 'ENERO'
NMES(2) = 'FEBRERO'
NMES(3) = 'MARZO'
NMES(4) = 'ABRIL'
NMES(5) = 'MAYO'
NMES(6) = 'JUNIO'
NMES(7) = 'JULIO'
NMES(8) = 'AGOSTO'
NMES(9) = 'SEPTIEMBRE'
NMES(10) = 'OCTUBRE'
NMES(11) = 'NOVIEMBRE'
NMES(12) = 'DICIEMBRE'

USE CONSE
   XCIA   = TRIM(CIA)
   PATIP  = TRIM(IP)
   PATVT  = TRIM(VT)
   PATCC  = TRIM(CC)
   PATCP  = TRIM(CP)
   PATCB  = TRIM(CB)
   PATCH  = TRIM(CH)
   PATOT  = TRIM(OT)
   NLPP   = NLPP
   ffffff = fechac
   USE
MES =  NMES(MONTH(FFFFFF))

SET PATH TO &PATVT,&PATIP,&PATCC,&PATCP,&PAT,&PATC,&XPATCB




********** Opciones de Menu Principal ************

    DEFI WIND TERMINAL FROM 0,0 TO 22,79 TITLE 'CONSULTA EN PANTALLA'

OP = 0
DO WHILE .T.
   CLEAR
   @0,0 TO 22,79 DOUBLE
   @3,1 TO  3,78 DOUBLE
   @ 2,1 SAY PADC(XCIA,78,' ')
   @ 1,55 SAY STR(DAY(FFFFFF),2)+' DE '+MES+' DE '+STR(YEAR(FFFFFF),4)
   @04,20 SAY  ' MODULO DE INTERFASES'
   @06,10 PROMPT ' 1.- Interfase adcxp '      
   @08,10 PROMPT ' 2.- Crea Archivo para ADCON '
   @10,10 PROMPT ' 3.- Agrega todo lo de ADSYS '
   MENU TO OP
   DO CASE
      CASE OP = 1
         DO IP020010
      CASE OP = 2
         DO cb010006
      CASE OP = 3
         DO cb050007
      CASE OP = 0
         RETURN
   ENDCASE
ENDDO
RETURN
