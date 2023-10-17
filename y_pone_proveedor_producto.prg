sele 0
use inv_producto
*SET FILTER TO AT('JUAN',producto)>0
*replace ALL proveedor WITH 200195

*SET FILTER TO AT('PALP',producto)>0
*replace ALL proveedor WITH 10005

*SET FILTER TO AT('PNPH',producto)>0
*replace ALL proveedor WITH 580473


sele 0
use cxp_proveedor
DO WHILE .not. EOF()
   xclave = ALLTRIM(clave)
   xproveedor = proveedor
   SELECT inv_producto
   SET FILTER TO AT('P'+xclave,producto)>0 
   replace ALL proveedor WITH xproveedor,clave WITH xclave
   SELECT cxp_proveedor
   SKIP
enddo   
   
SELECT inv_producto
USE
SELECT cxp_proveedor
use
