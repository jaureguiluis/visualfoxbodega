*   GENERA SALDOS EN CARTERA DE CADA MOVIMIENTO
SELECT 1
USE CxC_SALDO
set order to 1
REPLACE ALL SALDO WITH 0
GO BOTTOM
DO WHILE  .NOT. BOF()
      XSALDO = 0
      XREFER = REFER
      DO WHILE XREFER = REFER .AND. .NOT. BOF()
         IF CLAVE < 51
            XSALDO = XSALDO + VALOR
         ELSE
            XSALDO = XSALDO + VALOR
         ENDIF
         SKIP -1
         @7,10 SAY CLIENTE PICT '99999'
      ENDDO
      IF BOF()
         REPLACE SALDO WITH XSALDO
         EXIT
      ENDIF
      SKIP
      REPLACE SALDO WITH XSALDO
      SKIP - 1
      @7,10 SAY CLIENTE PICT '99999'
ENDDO
CLOSE table all
cMessageTitle = 'ok.......'
cMessageText = 'Proceso Terminado'
*nDialogType = 2 + 4 
*nAnswer = MESSAGEBOX(cMessageText, nDialogType, cMessageTitle)
nAnswer = MESSAGEBOX(cMessageText,cMessageTitle)
