set sysmenu off
SET SAFETY Off
SET SECONDS OFF
set excl off
SET DELETE ON
SET EXACT OFF
set century on
SET HOUR TO 24
set date to dmy
set talk off
showtips=.t.
_ASCIIROWS = 60
_ASCIICOLS = 300
= CAPSLOCK(.T.)
= NUMLOCK(.T.)
= INSMODE(.T.)
public ffffff,xusuario,xterminal,xnivel,xnofecha,xempresa,xpathrepo,xpathpaso,xpathopera,xpathcomun
*sele 0
*use inv_salida
*set order to folio
*sele 0
*use inv_salida_producto
*do while .not. eof()
*   Yfolio = folio
*   Ymovimiento = movimiento
*   Yfecha_c = fecha_c
*   sele inv_salida
*   seek Yfolio
*   IF EOF()
*      sele inv_salida_producto
*      DELETE
*   endif
*   sele inv_salida_producto
*   skip
*ENDDO
*   sele inv_salida_producto
*   USE
*   sele inv_salida
*   USE
CLOSE DATABASES   
do form LOGIN
read events
CLOSE DATABASES
QUIT