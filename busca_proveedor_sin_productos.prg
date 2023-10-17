* busca proveedores sin productos 
SELECT 0
USE inv_producto
SET ORDER TO producto

SELECT 0
USE cxp_proveedor
DO WHILE .not. EOF()
   xclave = clave
   SELECT inv_producto
   SEEK 'P'+xclave
   IF EOF()
      =MESSAGEBOX(nombre)
   ENDIF
   sele cxp_proveedor
   skip
ENDDO
      
