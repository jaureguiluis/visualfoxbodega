sele 0use inv_productoset order to productoreplace ALL activo WITH .f.sele 0use inv_entrada_productodo while .not. eof()   xproducto = producto   sele inv_producto   seek xproducto   replace activo with .t.   sele inv_entrada_producto   skipenddo   