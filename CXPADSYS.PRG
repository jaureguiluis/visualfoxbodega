*   GENERA ARCHIVO PARA ADCON
*
@ 4,1  TO 21,78 CLEAR
@ 23,1 SAY SPACE(78)
XARCH = "     "
@ 6,25 SAY 'GENERA ARCHIVO DE MOVIMIENTOS PARA ADCXP'
@10,20 SAY 'Teclee Nombre de Archivo :    ' GET XARCH PICT "XXXXX"
@23,25 SAY '<ESC> Terminar'
READ
IF LASTKEY() = 27
   RETURN
ENDIF
USE &XARCH

     XINTERFASE = '\ADSYS\ADCXP\F\CXP'+XARCH+'.TXT'

   @16,10 SAY XINTERFASE


   COPY TO &XINTERFASE TYPE SDF 

   a1='\bodega\arch\INTXADCP.dbf'

   xarch = "\bodega\arch\CXP"+XMES+"3"+xdia
   a2='\ADSYS\ADCXP\F\CXP'+XARCH+'.dbf'
   copy file &a1 to  &a2
   run \adsys\addbm\addbm -p &xarch

CLOSE DATABASES
RETURN
