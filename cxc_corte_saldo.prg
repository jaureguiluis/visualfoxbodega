XA = XTERMINAL+"cs"
SORT ON CLIENTE,REFER,CLAVE,DOCUMENTO FOR FECHAC <= XFECHA TO &xpathpaso\&xa
SELECT 4
USE &XA
INDEX ON STR(CLIENTE,6)+STR(REFER,6)+STR(CLAVE,2)+STR(DOCUMENTO,6) TO &xpathpaso\&xa
REPLACE ALL SALDO WITH 0
GO BOTTOM
DO WHILE  .NOT. BOF()
   XSALDO = 0
   XREFER = REFER
   DO WHILE XREFER = REFER .AND. .NOT. BOF()
      XSALDO = XSALDO + VALOR
      SKIP -1
   ENDDO
   IF BOF()
      REPLACE SALDO WITH XSALDO
      EXIT
   ENDIF
   SKIP
   REPLACE SALDO WITH XSALDO
   SKIP - 1
ENDDO
