PROCEDURE TERMINAL
   SET CLOCK OFF
   SET PRINTER TO
   CLEAR
   @ 23,5 SAY  CHR(24)+' '+CHR(25)+' '+CHR(27)+' '+CHR(26)+;
   '  PgUp  PgDn  End   PARA MOVERSE   <ESC> PARA TERMINAR CONSULTA'
   XT =XTERMINAL+'.TXT'
   MODI COMM &XT NOEDIT WINDOW TERMINAL
   SET CLOCK ON
   RETURN
*
*
PROCEDURE ERR
PARAMETER LN,PR,ML
DO CASE
CASE ERROR() = 125 .OR. ERROR() = 30
   DEFI WIND WERR FROM 14,5 TO 21,57 COLOR SCHEME 8
   ACTI WIND WERR
   @0,01 SAY 'Falla en la impresora, favor de ponerla en linea'
   @2,01 SAY '       Para continuar teclee [RETURN]'
   @4,01 SAY '         Para terminar teclee [ESC]'
   WAIT ''
   IF LASTKEY() = 27
      CLOSE DATA
      DEAC WIND WERR
      DEAC WIND CAPTURA
      RETURN TO MASTER
   ENDIF
   SET DEVICE TO PRINT
   DEAC WIND WERR
CASE ERROR() = 1705
   DEFI WIND WERR FROM 10,20 TO 13,57 COLOR SCHEME 9
   ACTI WIND WERR
   @0,01 SAY 'Informacion no disponible'
   @1,01 SAY 'Intente de mas Tarde'
   WAIT ''
   CLOSE DATA
   DEAC WIND WERR
   DEAC WIND CAPTURA
   RETURN TO MASTER
OTHER WISE
   DEFI WIND WERR FROM 4,5 TO 21,56 COLOR SCHEME 7
   ACTI WIND WERR
   SET DEVICE TO SCREEN
   @0,1  SAY 'Falla en el sistema favor de anotar el mensaje'
   @1,1  SAY 'de error y el programa donde ocurrio, salga y '
   @2,1  SAY 'de reset a la maquina, regrese y mande la opcion'
   @3,1  SAY 'de mantenimiento al sistema en cada uno de los '
   @4,1  SAY 'modulos e intente de nuevo si continua la falla '
   @5,1  SAY 'favor llamar al Depto. de sistemas para reportar'
   @7,1  SAY 'PROGRAMA       # ERROR          LINEA #'
   @8,1  SAY ALLTRIM(PR)
   @8,20 SAY ALLTRIM(STR(ERROR()))
   @8,35 SAY ALLTRIM(STR(LN))
   @10,1  SAY '*** MENSAJE DE ERROR Y CONTENIDO DE LA LINEA ***'
   @12,1 SAY MESSAGE()
   @14,1 SAY ML
   CLOSE DATABASES
   WAIT ''
   DEAC WIND WERR
   DEAC WIND CAPTURA
   RETURN TO MASTER
ENDCASE




PROCEDURE BCUENTA
   DO WHILE LASTKEY() = 4 .OR. LASTKEY() = 28 .OR. LASTKEY() = 19
      @ 23,20 SAY  +CHR(24)+' '+CHR(25)+' Seleccionar   '+;
      CHR(17)+CHR(196)+CHR(217)+' Confirmar  <ESC> Terminar'
      ACTI POPUP POPCUENTA
      XCUENTA = CUENTA
      XSCUENTA = SCUENTA
      XSSCUENTA = SSCUENTA
      XSSSCUENTA = SSSCUENTA
   ENDDO
   @23,1 SAY SPACE(78)

PROCEDURE BCLAVE
   DO WHILE LASTKEY() = 4 .OR. LASTKEY() = 28 .OR. LASTKEY() = 19
      @ 23,20 SAY  +CHR(24)+' '+CHR(25)+' Seleccionar   '+;
      CHR(17)+CHR(196)+CHR(217)+' Confirmar  <ESC> Terminar'
      ACTI POPUP POPCLAVE
      XCLAVE = CONCEPTO
   ENDDO
   @23,1 SAY SPACE(78)

