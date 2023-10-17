xa = xterminal+"a"
xb = xterminal+"b"

SELECT 0
USE inv_entrada_producto
SET ORDER TO PRODUCTO   && PRODUCTO+SPRODUCTO

SELECT 0
USE inv_salida_producto


go top
DO WHILE .NOT. EOF()
   xproducto=producto
*   xsproducto=sproducto
   xcosto = precio
   xgrupo = grupo
   xcantidad = cantidad
   xbultos = bultos
   sele inv_entrada_producto 
   seek xproducto
   DO WHILE xproducto = producto .AND. .NOT. EOF()
      IF saldo <= xcantidad
         replace saldo WITH saldo - xcantidad
      ELSE
         xcantidad = saldo
         replace saldo WITH 0 
         DO while xcantidad >0
            sele inv_entrada_producto 
            seek xproducto
            DO WHILE xproducto = producto .AND. .NOT. EOF()
              IF saldo <= xcantidad
                 replace saldo WITH saldo - xcantidad
              endif            
            enddo  
         enddo   
      ENDIF
      SKIP
   ENDDO
ENDDO
THISFORM.RELEASE