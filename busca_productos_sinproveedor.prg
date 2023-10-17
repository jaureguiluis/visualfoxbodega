* busca productos que no tienen proveedor
SELECT 0
USE cxp_proveedor
SELECT 0
USE inv_producto
DO WHILE .not. EOF()
   xproveedor = proveedor
   SELECT cxp_proveedor
   LOCATE FOR proveedor = xproveedor
   IF EOF()
      SELECT inv_producto 
      replace proveedor WITH 0
   ENDIF
   SELECT inv_producto 
   skip
ENDDO
      
