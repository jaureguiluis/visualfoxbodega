* busca  cuantos dias tardan en pagar las facturas


use p_cxc_juntar
copy struc to pagos1
copy struc to pagos
sele 0
use pagos1
sele 0
use pagos

sele 0
use cxc_credito
index on refer to x
set filter to clave = 76

sele 0
use cxc_cliente
set order to cliente

sele 0
use cxc_cargo
set order to documento
set filter to clave = 1
go top
do while .not. eof()
   xcliente = cliente
   xrefer = refer
   xfecha = fecha
   xfechap = fecha
   xclave = clave
   sele cxc_credito
   seek xrefer
   do while cliente = xcliente .and. refer = xrefer .and. .not. eof()
      if clave = 76 
         xfechap = fecha
      endif
      skip
   enddo
   xdias = xfechap - xfecha
   sele cxc_cliente
   seek xcliente
   xnom = corto
   sele pagos1
   append blank
   replace cliente with xcliente,refer with xrefer,dias with xdias,nombre with xnom,clave with xclave   
   sele cxc_cargo
   skip
enddo

sele pagos1
set filter to dias <=0
delete all
set filter to
index on cliente to xx
go top
do while .not. eof()
   xnom = nombre
   xcliente = cliente
   xdias = 0
   xnum = 0
   do while cliente = xcliente .and. .not. eof()
      xdias = xdias + dias
      xnum = xnum + 1
      skip
   enddo
   sele pagos
   append blank
   replace dias with xdias/xnum,nombre with xnom,refer with xnum   
   sele pagos1
enddo      

sele pagos
index on dias to xxx
report form pagos_facturas to print prompt preview
    

close table all   
return