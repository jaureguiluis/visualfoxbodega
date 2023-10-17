SELECT 0
USE cnt_cuenta
SET ORDER TO cuenta

SELECT 0
USE cnt_poliza
DO WHILE .not. EOF()
   xcuenta    = cuenta
   xscuenta   = scuenta
   xsscuenta  = sscuenta
   xssscuenta = ssscuenta
   sele cnt_cuenta
   seek str(xcuenta,4)+str(xscuenta,4)+str(xsscuenta,3)+str(xssscuenta,3)
   IF EOF()
      =MESSAGEBOX(xcuenta)
      APPEND BLANK
      replace cuenta WITH xcuenta,scuenta WITH xscuenta,sscuenta WITH xsscuenta,ssscuenta WITH xssscuenta
   ENDIF
   SELECT cnt_poliza
   SKIP
ENDDO
      