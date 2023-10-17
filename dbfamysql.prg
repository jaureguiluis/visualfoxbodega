USE inv_clave
COPY TO c:\dbfamysql\inv_clave.dbf TYPE FOXPLUS
USE inv_entrada
replace ALL origen with strtran(origen,',',' ')
replace ALL chofer with strtran(chofer,',',' ')
replace ALL chofer with strtran(chofer,"'"," ")
replace ALL placas with strtran(placas,',',' ')
*SET FILTER TO YEAR(fecha_c) = 2011
COPY TO c:\dbfamysql\inv_entrada.dbf TYPE FOXPLUS
USE inv_entrada_producto
replace ALL etiqueta with strtran(etiqueta,"'"," ")
*SET FILTER TO YEAR(fecha_c) = 2011
COPY TO c:\dbfamysql\inv_entrada_producto.dbf TYPE FOXPLUS
USE inv_gasto
COPY TO c:\dbfamysql\inv_gasto.dbf TYPE FOXPLUS
USE inv_grupo
COPY TO c:\dbfamysql\inv_grupo.dbf TYPE FOXPLUS
USE inv_producto
COPY TO c:\dbfamysql\inv_producto.dbf TYPE FOXPLUS
USE inv_producto_color
COPY TO c:\dbfamysql\inv_producto_color.dbf TYPE FOXPLUS
USE inv_producto_etiqueta
COPY TO c:\dbfamysql\inv_producto_etiqueta.dbf TYPE FOXPLUS
USE inv_producto_tamano
COPY TO c:\dbfamysql\inv_producto_tamano.dbf TYPE FOXPLUS
USE inv_salida
COPY TO c:\dbfamysql\inv_salida.dbf TYPE FOXPLUS
USE inv_salida_producto
replace ALL etiqueta with strtran(etiqueta,"'"," ")
COPY TO c:\dbfamysql\inv_salida_producto.dbf TYPE FOXPLUS

USE emb_remision
COPY TO c:\dbfamysql\emb_remision.dbf TYPE FOXPLUS
USE emb_remision_carga
COPY TO c:\dbfamysql\emb_remision_carga.dbf TYPE FOXPLUS
USE emb_remision_producto
COPY TO c:\dbfamysql\emb_remision_producto.dbf TYPE FOXPLUS
USE emb_transportista
COPY TO c:\dbfamysql\emb_transportista.dbf TYPE FOXPLUS
USE emb_transportista_chofer
COPY TO c:\dbfamysql\emb_transportista_chofer.dbf TYPE FOXPLUS
USE emb_transportista_unidad
COPY TO c:\dbfamysql\emb_transportista_unidad.dbf TYPE FOXPLUS

USE cxc_agente
COPY TO c:\dbfamysql\cxc_agente.dbf TYPE FOXPLUS
USE cxc_banco
COPY TO c:\dbfamysql\cxc_banco.dbf TYPE FOXPLUS
USE cxc_cargo
*SET FILTER TO YEAR(fecha_c) = 2011
COPY TO c:\dbfamysql\cxc_cargo.dbf TYPE FOXPLUS
USE cxc_cheque_devuelto
*SET FILTER TO YEAR(fecha) = 2011
COPY TO c:\dbfamysql\cxc_devuelto.dbf TYPE FOXPLUS
USE cxc_ciudad
COPY TO c:\dbfamysql\cxc_ciudad.dbf TYPE FOXPLUS
USE cxc_clave
COPY TO c:\dbfamysql\cxc_clave.dbf TYPE FOXPLUS
USE cxc_cliente
COPY TO c:\dbfamysql\cxc_cliente.dbf TYPE FOXPLUS
USE cxc_credito
*SET FILTER TO YEAR(fecha_c) = 2011
COPY TO c:\dbfamysql\cxc_credito.dbf TYPE FOXPLUS
USE cxc_estado
COPY TO c:\dbfamysql\cxc_estado.dbf TYPE FOXPLUS
USE cxc_forma
COPY TO c:\dbfamysql\cxc_forma.dbf TYPE FOXPLUS
USE cxc_pais
COPY TO c:\dbfamysql\cxc_pais.dbf TYPE FOXPLUS
USE cxc_posfechado
*SET FILTER TO YEAR(fecha) = 2011
COPY TO c:\dbfamysql\cxc_posfechado.dbf TYPE FOXPLUS
USE cxc_saldo
COPY TO c:\dbfamysql\cxc_saldo.dbf TYPE FOXPLUS
USE cxc_tcredito
COPY TO c:\dbfamysql\cxc_tcredito.dbf TYPE FOXPLUS
USE
CLOSE TABLES all



