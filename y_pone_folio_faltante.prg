sele 0
use inv_salida
set order to folio
sele 0
use inv_salida_producto
do while .not. eof()
   xfolio = folio
   xmovimiento = movimiento
   xfecha_c = fecha_c
   sele inv_salida
   seek xfolio
   IF EOF()
      sele inv_salida_producto
      DELETE
   endif
   sele inv_salida_producto
   skip
enddo
   