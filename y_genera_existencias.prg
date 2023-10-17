* genera existencias
xa = xterminal+"a"

USE p_inv_juntar
copy struc to &xpathpaso\&xa
use

SELECT 0
USE inv_producto_saldo EXCLUSIVE
zap

SELECT 0
USE inv_entrada_producto
SET ORDER TO producto
replace ALL saldo WITH 0,saldob WITH 0


sele 0
use &xa alias p_inv_juntar excl
index on producto to &xa

APPEND FROM inv_salida_producto
replace ALL cantidad WITH cantidad * -1,bultos WITH bultos * -1
APPEND FROM inv_entrada_producto
GO top

DO WHILE .not. EOF()
   xproducto = producto
   xsaldo = 0
   xbultos = 0
   DO WHILE producto = xproducto .and. .not. EOF()
      xsaldo = xsaldo + cantidad
      xbultos = xbultos + bultos
      SKIP
   ENDDO
   SELECT inv_producto_saldo
   APPEND BLANK
   replace producto WITH xproducto,saldo WITH xsaldo,bultos WITH xbultos   

   SELECT inv_entrada_producto
   SEEK xproducto
   replace saldo WITH xsaldo,saldob WITH xbultos   
   
   SELECT p_inv_juntar
ENDDO

CLOSE TABLES all


   
      
   