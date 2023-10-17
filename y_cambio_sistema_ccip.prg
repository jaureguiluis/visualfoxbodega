CLOSE TABLES all

sele 0
use inv_salida
set order to folio
sele 0
use inv_salida_producto
do while .not. eof()
   xfolio = folio
   sele inv_salida
   seek xfolio
   xcliente = cliente
   xfactura = factura
   xticket = ticket

   sele inv_salida_producto
   replace cliente WITH xcliente,factura WITH xfactura,ticket WITH xticket
   skip
ENDDO
WAIT 'paso 1'
CLOSE TABLES all
use inv_salida_producto
replace ALL Clave WITH 53,Movimiento WITH 'Contado' FOR clave = 52

use inv_salida EXCLUSIVE
ZAP

USE cxc_cargo
replace ALL Clave WITH 3,Movimiento WITH 'Cont' FOR clave = 2


USE cxc_saldo
replace ALL Clave WITH 3,Movimiento WITH 'Cont' FOR clave = 2

   